import 'package:flutter/material.dart';

class ImagenWidget extends StatelessWidget {
  const ImagenWidget({
    super.key,
    required this.image,
    this.alignment,
  });

  final String image;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: double.infinity,
      fit: BoxFit.cover,
      alignment: alignment ?? Alignment.topLeft,
    );
  }
}
