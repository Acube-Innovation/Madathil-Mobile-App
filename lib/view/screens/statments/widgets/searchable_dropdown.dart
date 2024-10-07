import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class SearchableDropdown extends StatefulWidget {
  final String hintText;
  final Function(String) onItemSelected;
  final String? Function(String?)? validator;

  SearchableDropdown({
    Key? key,
    required this.hintText,
    required this.onItemSelected,
    this.validator, // Optional validator function
  }) : super(key: key);

  @override
  _SearchableDropdownState createState() => _SearchableDropdownState();
}

class _SearchableDropdownState extends State<SearchableDropdown> {
  TextEditingController _searchController = TextEditingController();
  String? _selectedCustomer;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    // Fetch initial data when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchCustomers();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Function to fetch customers with optional search item
  void _fetchCustomers({String? searchItem}) {
    final customerViewModel =
        Provider.of<CommonDataViewmodel>(context, listen: false);
    customerViewModel.getCustomerList(searchItem: searchItem);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
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
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        ),
        if (_errorText != null) // Display validation error if exists
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              _errorText!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
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
                                        _errorText = null; // Reset error
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

  // Function to trigger validation from the parent widget
  bool validate() {
    if (widget.validator != null) {
      setState(() {
        _errorText = widget.validator!(_selectedCustomer);
      });
    }
    return _errorText == null;
  }
}
