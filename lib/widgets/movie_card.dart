import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_ui/models/imdb.model.dart';
import 'package:movies_ui/models/movie_model.dart';
import 'package:movies_ui/screens/movie/move_screen.dart';
import 'package:movies_ui/widgets/app_chip.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
    required this.imdb,
  });

  final Movie movie;
  final IMDB imdb;

  void goToMovieScreen(BuildContext context, Movie movie) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 800),
        reverseTransitionDuration: const Duration(milliseconds: 800),
        pageBuilder: (_, __, ___) => FadeTransition(
          opacity: __,
          child: MovieScreen(
            movie: movie,
            imdb: imdb,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToMovieScreen(context, movie),
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 250,
        height: 430,
        child: Stack(
          children: [
            Hero(
              tag: movie.name,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(
                  imageUrl: movie.image,
                  width: 300,
                  height: 533,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppChip(
                    text: imdb.imdb.toString(),
                    color: Colors.yellow,
                    textColor: Colors.black,
                  ),
                  const Spacer(),
                  Text(
                    movie.name,
                    style: const TextStyle(
                      shadows: [
                        Shadow(
                          color: Colors.black54,
                          offset: Offset(0, 1),
                          blurRadius: 10,
                        ),
                      ],
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
