import 'package:flutter/material.dart';
import 'package:sportnews/src/pages/home/widget/image_widget.dart';

class ContainerAnimated extends StatelessWidget {
  const ContainerAnimated({
    super.key,
    required this.secLayerImageWidth,
    required this.isSelected,
    required this.deviceWidth,
    required this.image,
  });

  final double secLayerImageWidth;
  final bool isSelected;
  final double deviceWidth;
  final String image;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: secLayerImageWidth,
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      height: 175,
      duration: const Duration(milliseconds: 0),
      child: ClipRRect(
        borderRadius: !isSelected || secLayerImageWidth == deviceWidth - 30
            ? BorderRadius.circular(18)
            : const BorderRadius.only(
                topLeft: Radius.circular(18),
                bottomLeft: Radius.circular(18),
              ),
        child: ImagenWidget(image: image),
      ),
    );
  }
}
