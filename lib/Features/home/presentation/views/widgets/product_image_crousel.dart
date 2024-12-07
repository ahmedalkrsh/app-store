import 'package:flutter/material.dart';

class ProductImageCarousel extends StatelessWidget {
  final List<String> images;

  const ProductImageCarousel({required this.images, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.network(
            images[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
