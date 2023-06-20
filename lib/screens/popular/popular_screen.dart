import 'package:flutter/material.dart';
import 'package:movies_ui/models/movie_model.dart';
import 'package:movies_ui/screens/home/widgets/app_header.dart';
import 'package:movies_ui/screens/popular/widgets/popular_page_view.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  late PageController _pageController;
  final int _page = 5;

  @override
  void initState() {
    _pageController =
        PageController(initialPage: _page.toInt(), viewportFraction: 0.5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOut,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 150, left: 20),
                  child: Text(
                    'Most View',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                PopularPageView(
                  pageController: _pageController,
                  movieList: mostView,
                  movieName: mostView,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50, left: 20),
                  child: Text(
                    'Best Seller',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                PopularPageView(
                  pageController: _pageController,
                  movieList: bestSeller,
                  movieName: bestSeller,
                ),
              ],
            ),
          ),
          const AppHeader(),
        ],
      ),
    );
  }
}
