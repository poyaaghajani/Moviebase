import 'package:flutter/material.dart';
import 'package:movies_ui/screens/home/widgets/all_movies.dart';
import 'package:movies_ui/screens/home/widgets/app_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Size size;
  double top = -300;
  double left = -300;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return GestureDetector(
      onPanUpdate: (details) {
        var topPos = top + (details.delta.dy * 1.5);
        var leftPos = left + (details.delta.dx * 1.5);
        //set the state
        setState(() {
          top = topPos;
          left = leftPos;
        });
      },
      child: Container(
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
              top: top,
              left: left,
              child: const AllMovies(),
            ),
            const AppHeader(),
          ],
        ),
      ),
    );
  }
}
