import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:gap/gap.dart';
import 'package:sportnews/src/features/home/domain/usecases/deletenews_usecase.dart';
import 'package:sportnews/src/features/home/domain/usecases/listnews_usecase.dart';
import 'package:sportnews/src/features/home/presentation/bloc/bloc.dart';
import 'package:sportnews/src/features/home/presentation/widget/body.dart';
import 'package:sportnews/src/features/home/presentation/widget/input_search.dart';
import 'package:sportnews/src/shared/constant/sport_news_ui.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final listGetNewsSportUseCase = Modular.get<ListNewsSportUseCase>();
    final deleteNewsSportUseCase = Modular.get<DeleteNewsSportUseCase>();
    return BlocProvider<BlocHome>(
      create: (context) => BlocHome(
        listBreedUseCase: listGetNewsSportUseCase,
        deleteNewsSportUseCase: deleteNewsSportUseCase,
      )..add(LoadListNewSportEvent()),
      child: BlocListener<BlocHome, HomeState>(
        listener: _listener,
        child: Scaffold(
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
                const Expanded(
                  child: ListViewNews(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _listener(BuildContext context, HomeState state) async {
  if (state is LoadedDeleteNewsSportState) {
    context.read<BlocHome>().add(LoadListNewSportEvent());
  }
}
