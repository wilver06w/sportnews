import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sportnews/src/pages/home/widget/container_animated.dart';
import 'package:sportnews/src/pages/home/widget/image_widget.dart';
import 'package:sportnews/src/shared/constant/colors.dart';

class CardChecked extends StatefulWidget {
  const CardChecked({
    super.key,
    required this.index,
    required this.imagen,
  });

  final int index;
  final String imagen;

  @override
  State<CardChecked> createState() => _CardCheckedState();
}

class _CardCheckedState extends State<CardChecked> {
  // Defines the drag calculation function, which handles the user's swipe gesture.
  void dragCalculation(
      int index, PointerMoveEvent movement, double deviceWidth) {
    if (movement.delta.dx > 0 || movement.delta.dx < 0) {
      secLayerImageWidth = movement.localPosition.dx;
      imageWidth = (deviceWidth - 40) - secLayerImageWidth;

      if (imageWidth < 25 && movement.delta.dx > 0) {
        secLayerImageWidth =
            MediaQueryData.fromView(View.of(context)).size.width - 30;
        imageWidth = (deviceWidth - 40);
      }

      if (movement.delta.distance > 30) {
        if (movement.delta.dx > 0) {
          secLayerImageWidth =
              MediaQueryData.fromView(View.of(context)).size.width - 30;
          imageWidth = (deviceWidth - 20);
        } else {
          secLayerImageWidth = 50;
          imageWidth = (deviceWidth - 40) - secLayerImageWidth;
        }
      }
    }
  }

  // Defines the initial width of the image.
  double imageWidth = 10;

  double secLayerImageWidth = MediaQueryData.fromView(
              WidgetsBinding.instance.platformDispatcher.views.first)
          .size
          .width -
      30;

  StreamController<int> selectedIndexStreamController = StreamController();
  @override
  void initState() {
    selectedIndexStreamController.add(-1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Listener(
        onPointerMove: (movement) {
          selectedIndexStreamController.add(widget.index);
          dragCalculation(
            widget.index,
            movement,
            deviceWidth,
          );
        },
        child: SizedBox(
          height: 175,
          width: double.infinity,
          child: StreamBuilder(
            stream: selectedIndexStreamController.stream,
            builder: (context, snapshot) {
              return snapshot.data == widget.index
                  ? Stack(
                      children: [
                        Center(
                          child: Container(
                            margin: const EdgeInsets.only(right: 0, left: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              gradient: const LinearGradient(
                                  colors: [
                                    SportNewsUiColor.aeroBlue,
                                    SportNewsUiColor.primaryColor
                                  ],
                                  begin: FractionalOffset(3, 2),
                                  end: FractionalOffset(0, 0),
                                  tileMode: TileMode.clamp),
                            ),
                            height: 160,
                            width: double.infinity,
                            child: const Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Animated container for the second layer image.
                        ContainerAnimated(
                          index: widget.index,
                          selectedIndex: snapshot.data ?? -1,
                          secLayerImageWidth: secLayerImageWidth,
                          deviceWidth: deviceWidth,
                          imagen: widget.imagen,
                        ), // Positioned container for the swipe effect.
                        if (secLayerImageWidth != deviceWidth - 30)
                          Positioned(
                            right:
                                imageWidth < 0 ? imageWidth *= -1 : imageWidth,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(right: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Center(
                                    child: AnimatedContainer(
                                      width: imageWidth,
                                      height: 220,
                                      duration: const Duration(milliseconds: 0),
                                      child: Transform.flip(
                                        flipX: true,
                                        child: Opacity(
                                          opacity: 0.85,
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomRight: Radius.circular(16),
                                              topRight: Radius.circular(16),
                                            ),
                                            child: ImagenWidget(
                                              image: widget.imagen,
                                              alignment: Alignment.topRight,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 3,
                                    height: 220,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [Colors.white, Colors.grey],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    )
                  : ContainerAnimated(
                      index: widget.index,
                      secLayerImageWidth: secLayerImageWidth,
                      selectedIndex: snapshot.data ?? -1,
                      deviceWidth: deviceWidth,
                      imagen: widget.imagen,
                    );
            },
          ),
        ),
      ),
    );
  }
}
