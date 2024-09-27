import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class ItemSearchableDropdown extends StatefulWidget {
  final String hintText;
  final Function(String) onItemSelected;

  ItemSearchableDropdown({
    required this.hintText,
    required this.onItemSelected,
  });

  @override
  _SearchableDropdownState createState() => _SearchableDropdownState();
}

class _SearchableDropdownState extends State<ItemSearchableDropdown> {
  TextEditingController _searchController = TextEditingController();
  String? _selectedItem;

  @override
  void initState() {
    super.initState();
    // Fetch initial data when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchItems(); // Initial load of all customers
    });
  }

  // Function to fetch customers with optional search item
  void _fetchItems({String? searchItem}) {
    final customerViewModel =
        Provider.of<CommonDataViewmodel>(context, listen: false);
    customerViewModel.getItemList(searchItem: searchItem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showSearchableDropdown(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primeryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedItem ?? widget.hintText,
              style: const TextStyle(fontSize: 16),
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
                          hintText: 'Search Item',
                          prefixIcon: Icon(Icons.search),
                        ),
                        onChanged: (value) {
                          _fetchItems(
                              searchItem: value); // Trigger the search
                        },
                      ),
                    ),
                    customerViewModel.isloading!
                        ? const Center(child: CircularProgressIndicator())
                        : customerViewModel.items.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: customerViewModel.items.length,
                                itemBuilder: (context, index) {
                                  String item =
                                      customerViewModel.items[index];
                                  return ListTile(
                                    title: Text(item),
                                    onTap: () {
                                      setState(() {
                                        _selectedItem = item;
                                      });
                                      widget.onItemSelected(
                                          item); // Pass the selected customer
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
