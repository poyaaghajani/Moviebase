import 'package:flutter/material.dart';
import 'package:movies_ui/models/movie_model.dart';
import 'package:movies_ui/screens/book_ticket/widgets/day_selector.dart';
import 'package:movies_ui/screens/popular/widgets/popular_card.dart';
import 'package:movies_ui/widgets/translate_animation.dart';

class PopularPageView extends StatelessWidget {
  const PopularPageView({
    super.key,
    required this.pageController,
    required this.movieList,
    required this.movieName,
  });
  final PageController pageController;
  final List<Movie> movieList;
  final List<Movie> movieName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 240,
        child: TranslateRightAnimation(
          child: ShadowedBox(
            child: PageView(
              controller: pageController,
              children: List.generate(
                mostView.length,
                (index) => PopularCard(
                  movieType: movieList[index].image,
                  movieName: movieName[index].name,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
