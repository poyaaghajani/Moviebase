import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_ui/models/movie_model.dart';
import 'package:movies_ui/widgets/dotted_line.dart';
import 'package:movies_ui/widgets/glass_icon_button.dart';
import 'package:movies_ui/widgets/scaleup_animation.dart';
import 'package:movies_ui/widgets/translate_animation.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: movie.image,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 170,
            left: 40,
            right: 40,
            bottom: 120,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: TranslateRightAnimation(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 10,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: movie.image,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                              child: Column(
                                children: [
                                  const DottedLine(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 20),
                                        Text(
                                          movie.name,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 28,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        const Text(
                                          'May 15, 20:00',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Image.asset(
                                          'assets/qr.png',
                                          height: 100,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ScaleUpAnimation(
                child: GlassIconButton(
                  onTap: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.chevron_left_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
