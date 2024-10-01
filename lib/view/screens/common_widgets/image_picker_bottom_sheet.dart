import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:madathil/viewmodel/customer_viewmodel.dart';
import 'package:provider/provider.dart';

class ImagePickerBottomSheet1 extends StatelessWidget {
  final Function(XFile?) onImagePicked;

  const ImagePickerBottomSheet1({
    super.key,
    required this.onImagePicked,
  });
  @override
  Widget build(BuildContext context) {
    final imagePickerProvider =
        Provider.of<CustomerViewmodel>(context, listen: false);

    return SafeArea(
      child: Wrap(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Take Picture'),
            onTap: () async {
              Navigator.of(context).pop();
              final XFile? image =
                  await imagePickerProvider.pickImage(ImageSource.camera);
              onImagePicked(image);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Pick from Gallery'),
            onTap: () async {
              Navigator.of(context).pop();
              final XFile? image =
                  await imagePickerProvider.pickImage(ImageSource.gallery);
              onImagePicked(image);
            },
          ),
        ],
      ),
    );
  }
}
