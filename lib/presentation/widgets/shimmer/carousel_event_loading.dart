import 'package:carousel_slider/carousel_slider.dart';
import 'package:dicoding_event/core/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CarouselEventLoading extends StatelessWidget {
  const CarouselEventLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context, index, realIndex) {
        return Shimmer.fromColors(
          baseColor: context.colorScheme.surfaceContainerHigh,
          highlightColor: context.colorScheme.surfaceContainerLow,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),
        );
      },
      options: CarouselOptions(
        aspectRatio: 1.2,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
    );
  }
}
