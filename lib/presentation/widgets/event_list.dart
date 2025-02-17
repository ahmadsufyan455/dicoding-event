import 'package:cached_network_image/cached_network_image.dart';
import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:dicoding_event/gen/assets.gen.dart';
import 'package:dicoding_event/presentation/widgets/spaces.dart';
import 'package:flutter/material.dart';

class EventList extends StatelessWidget {
  final List<EventEntity> events;
  const EventList({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: events.length,
      itemBuilder: (context, index) => EvenListItem(event: events[index]),
      separatorBuilder: (context, index) => const SpaceHeight(10),
    );
  }
}

class EvenListItem extends StatelessWidget {
  final EventEntity event;
  const EvenListItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Text(event.name, maxLines: 2, overflow: TextOverflow.ellipsis),
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
    );
  }
}
