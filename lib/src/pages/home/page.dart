import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportnews/src/pages/home/models/news_model.dart';
import 'package:sportnews/src/shared/constant/sport_news_ui.dart';

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  // Defines the index of the selected item.
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 28,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.separated(
                itemCount: listSportNews.length,
                itemBuilder: (context, index) {
                  return Listener(
                    onPointerMove: (details) {
                      // dragCalculation(index, details, deviceWidth);
                    },
                    child: SizedBox(
                      height: 175,
                      width: double.infinity,
                      child: selectedIndex == index
                          ? Container()
                          : AnimatedContainer(
                              margin: const EdgeInsets.only(
                                right: 0,
                                left: 16,
                              ),
                              width: 800,
                              duration: const Duration(milliseconds: 0),
                              child: Image.asset(
                                '',
                                width: double.infinity,
                                fit: BoxFit.cover,
                                alignment: Alignment.topLeft,
                              ),
                            ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 20);
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
    imageId: 'assets/img1.jpg',
    title: 'Football players Yellow',
    id: 0,
  ),
  NewsModels(
    imageId: 'assets/img2.jpg',
    title: 'Football players Kids',
    id: 2,
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
