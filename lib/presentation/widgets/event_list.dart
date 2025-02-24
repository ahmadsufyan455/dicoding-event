import 'package:cached_network_image/cached_network_image.dart';
import 'package:dicoding_event/core/router/app_routes.dart';
import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:dicoding_event/gen/assets.gen.dart';
import 'package:dicoding_event/presentation/favorite/cubit/list_favorite_cubit.dart';
import 'package:dicoding_event/presentation/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EventList extends StatelessWidget {
  final List<EventEntity> events;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;

  const EventList({
    super.key,
    required this.events,
    this.physics,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: physics,
      itemCount: events.length,
      itemBuilder: (context, index) {
        return EvenListItem(event: events[index], padding: padding);
      },
      separatorBuilder: (context, index) => const SpaceHeight(10),
    );
  }
}

class EvenListItem extends StatelessWidget {
  final EventEntity event;
  final EdgeInsetsGeometry? padding;

  const EvenListItem({super.key, required this.event, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: () async {
          await context.pushNamed(
            AppRoutes.detail,
            pathParameters: {'id': (event.id).toString()},
          );
          if (!context.mounted) return;
          context.read<ListFavoriteCubit>().loadEventFavorites();
        },
        child: Container(
          padding: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1), // Soft shadow
                blurRadius: 6,
                offset: const Offset(2, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: event.imageLogo,
                  width: 120,
                  placeholder:
                      (context, url) =>
                          Image.asset(Assets.images.placeholder.keyName),
                ),
              ),
              const SpaceWidth(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SpaceHeight(8),
                    Text(
                      event.ownerName,
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
