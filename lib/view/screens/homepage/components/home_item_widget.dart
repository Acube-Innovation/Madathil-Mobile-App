import 'package:flutter/material.dart';

class HomeItemWidget extends StatelessWidget {
  final String? title;
  final String? image;
  final void Function()? onTap;
  const HomeItemWidget(
      {super.key,
      required this.title,
      required this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Card(
          elevation: 5,
          child: InkWell(
            onTap: onTap,
            child: SizedBox(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Image.asset(
                    image ?? "",
                    height: 70,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
