import 'package:flutter/material.dart';
import 'package:sportnews/src/pages/home/models/news_model.dart';
import 'package:sportnews/src/pages/home/widget/container_animated.dart';
import 'package:sportnews/src/pages/home/widget/image_widget.dart';
import 'package:sportnews/src/pages/home/widget/input_search.dart';
import 'package:sportnews/src/shared/constant/colors.dart';
import 'package:sportnews/src/shared/constant/sport_news_ui.dart';
import 'package:gap/gap.dart';

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  int selectedIndex = -1;
  double imageWidth = 10;

  // // Defines the initial width of the second layer image.

  // Defines the initial width of the second layer image.
  double secLayerImageWidth =
      MediaQueryData.fromView(WidgetsBinding.instance.window).size.width - 30;

  // double secLayerImageWidth = MediaQueryData.fromView(
  //             WidgetsBinding.instance.platformDispatcher.views.first)
  //         .size
  //         .width -
  //     30;

  // Defines the drag calculation function, which handles the user's swipe gesture.
  void dragCalculation(
      int index, PointerMoveEvent movement, double deviceWidth) {
    setState(() {
      selectedIndex = index;
    });

    if (movement.delta.dx > 0 || movement.delta.dx < 0) {
      setState(() {
        secLayerImageWidth = movement.localPosition.dx;
        imageWidth = (deviceWidth - 40) - secLayerImageWidth;
      });

      if (imageWidth < 25 && movement.delta.dx > 0) {
        setState(() {
          secLayerImageWidth =
              MediaQueryData.fromView(View.of(context)).size.width - 30;
          imageWidth = (deviceWidth - 40);
        });
      }

      if (movement.delta.distance > 30) {
        if (movement.delta.dx > 0) {
          setState(() {
            secLayerImageWidth =
                MediaQueryData.fromView(View.of(context)).size.width - 30;
            imageWidth = (deviceWidth - 20);
          });
        } else {
          setState(
            () {
              secLayerImageWidth = 50;
              imageWidth = (deviceWidth - 40) - secLayerImageWidth;
            },
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: Text(
                SportNewsUiValues.appName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: const InputSearch(),
            ),
            const Gap(12),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: listSportNews.length,
                itemBuilder: (context, index) {
                  final item = listSportNews[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Listener(
                      onPointerMove: (item) {
                        dragCalculation(index, item, deviceWidth);
                      },
                      child: SizedBox(
                        height: 175,
                        width: double.infinity,
                        child: selectedIndex == index
                            ? Stack(
                                children: [
                                  Center(
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                        right: 0,
                                        left: 20,
                                      ),
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
                                            Icons.delete_outline,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ContainerAnimated(
                                    isSelected: selectedIndex == index,
                                    image: item.imageId,
                                    secLayerImageWidth: secLayerImageWidth,
                                    deviceWidth: deviceWidth,
                                  ),
                                  if (secLayerImageWidth != deviceWidth - 30)
                                    Positioned(
                                      right: imageWidth < 0
                                          ? imageWidth *= -1
                                          : imageWidth,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: const EdgeInsets.only(right: 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Center(
                                              child: AnimatedContainer(
                                                width: imageWidth,
                                                height: 220,
                                                duration: const Duration(
                                                    milliseconds: 0),
                                                child: Transform.flip(
                                                  flipX: true,
                                                  child: Opacity(
                                                    opacity: 0.85,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        bottomRight:
                                                            Radius.circular(16),
                                                        topRight:
                                                            Radius.circular(16),
                                                      ),
                                                      child: ImagenWidget(
                                                        image: item.imageId,
                                                        alignment:
                                                            Alignment.topRight,
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
                                                  colors: [
                                                    Colors.white,
                                                    Colors.grey
                                                  ],
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
                                secLayerImageWidth: secLayerImageWidth,
                                isSelected: selectedIndex == index,
                                deviceWidth: deviceWidth,
                                image: item.imageId,
                              ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Gap(20);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final listSportNews = [
  NewsModels(
    imageId: 'assets/img2.jpg',
    title: 'Football players Kids',
    id: 0,
  ),
  NewsModels(
    imageId: 'assets/img1.jpg',
    title: 'Football players Yellow',
    id: 1,
  ),
  NewsModels(
    imageId: 'assets/img3.jpg',
    title: 'Ball control',
    id: 2,
  ),
  NewsModels(
    imageId: 'assets/img4.jpg',
    title: 'Soccer play',
    id: 3,
  ),
  NewsModels(
    imageId: 'assets/img5.jpg',
    title: 'Throw-in Ball',
    id: 2,
  ),
];
