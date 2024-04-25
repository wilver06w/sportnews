import 'package:flutter/material.dart';
import 'package:sportnews/src/shared/constant/colors.dart';
import 'package:sportnews/src/shared/constant/sport_news_ui.dart';

class InputSearch extends StatelessWidget {
  const InputSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 14),
        suffixIcon: Icon(
          Icons.mic,
          color: Colors.white,
        ),
        hintText: SportNewsUiValues.searchSportNews,
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        filled: true,
        fillColor: SportNewsUiColor.silverFoil,
      ),
    );
  }
}
