import 'package:flutter/material.dart';
import 'package:sportnews/src/pages/home/widget/image_widget.dart';

class ContainerAnimated extends StatelessWidget {
  const ContainerAnimated({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.secLayerImageWidth,
    required this.deviceWidth,
    required this.imagen,
  });

  final int index;
  final int selectedIndex;
  final double secLayerImageWidth;
  final double deviceWidth;
  final String imagen;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 0, left: 20),
      width: secLayerImageWidth,
      height: 175,
      duration: const Duration(milliseconds: 0),
      child: ClipRRect(
        borderRadius:
            selectedIndex != index || secLayerImageWidth == deviceWidth - 30
                ? BorderRadius.circular(18)
                : const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                  ),
        child: ImagenWidget(
          image: imagen,
        ),
      ),
    );
  }
}
