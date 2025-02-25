import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dicoding_event/core/extensions/build_context_ext.dart';
import 'package:dicoding_event/core/router/app_routes.dart';
import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:dicoding_event/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeCarouselImage extends StatelessWidget {
  final List<EventEntity> events;
  const HomeCarouselImage({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: events.length,
      itemBuilder: (context, index, realIndex) {
        return GestureDetector(
          onTap:
              () => context.pushNamed(
                AppRoutes.detail,
                pathParameters: {'id': (events[index].id).toString()},
              ),
          child: ImageView(imageUrl: events[index].imageLogo),
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

class ImageView extends StatelessWidget {
  final String imageUrl;
  const ImageView({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) {
          return Image.asset(
            Assets.images.placeholder.keyName,
            fit: BoxFit.cover,
          );
        },
        fit: BoxFit.cover,
        width: context.deviceWidth,
      ),
    );
  }
}
