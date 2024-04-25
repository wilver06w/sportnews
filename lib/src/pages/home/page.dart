import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sportnews/src/pages/home/models/news_model.dart';
import 'package:sportnews/src/pages/home/widget/card.dart';
import 'package:sportnews/src/pages/home/widget/input_search.dart';
import 'package:sportnews/src/shared/constant/sport_news_ui.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
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
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const InputSearch(),
            ),
            const Gap(12),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: listSportNews.length,
                itemBuilder: (context, index) {
                  final item = listSportNews[index];
                  return CardChecked(
                    imagen: item.imageId,
                    index: index,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Gap(20);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

const listSportNews =  [
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
