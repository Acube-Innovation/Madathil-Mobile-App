import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class SearchableDropdown extends StatefulWidget {
  final String hintText;
  final Function(String) onItemSelected;
  final String? Function(String?)? validator;

  SearchableDropdown({
    required this.hintText,
    required this.onItemSelected,
    this.validator,
  });

  @override
  _SearchableDropdownState createState() => _SearchableDropdownState();
}

class _SearchableDropdownState extends State<SearchableDropdown> {
  TextEditingController _searchController = TextEditingController();
  String? _selectedCustomer;

  @override
  void initState() {
    super.initState();
    // Fetch initial data when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchCustomers(); // Initial load of all customers
    });
  }

  // Function to fetch customers with optional search item
  void _fetchCustomers({String? searchItem}) {
    final customerViewModel =
        Provider.of<CommonDataViewmodel>(context, listen: false);
    customerViewModel.getCustomerList(searchItem: searchItem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showSearchableDropdown(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primeryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedCustomer ?? widget.hintText,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  height: 0,
                  color: _selectedCustomer == null
                      ? AppColors.grey.withOpacity(0.5)
                      : AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }

  // Function to display the searchable dropdown dialog
  void _showSearchableDropdown(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Consumer<CommonDataViewmodel>(
            builder: (context, customerViewModel, child) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          hintText: 'Search customer...',
                          prefixIcon: Icon(Icons.search),
                        ),
                        onChanged: (value) {
                          _fetchCustomers(
                              searchItem: value); // Trigger the search
                        },
                      ),
                    ),
                    customerViewModel.isloading!
                        ? const Center(child: CircularProgressIndicator())
                        : customerViewModel.customers.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: customerViewModel.customers.length,
                                itemBuilder: (context, index) {
                                  String customer =
                                      customerViewModel.customers[index];
                                  return ListTile(
                                    title: Text(customer),
                                    onTap: () {
                                      setState(() {
                                        _selectedCustomer = customer;
                                      });
                                      widget.onItemSelected(
                                          customer); // Pass the selected customer
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                  );
                                },
                              )
                            : const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text('No customers found'),
                              ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
