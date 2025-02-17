import 'package:dicoding_event/core/extensions/build_context_ext.dart';
import 'package:dicoding_event/presentation/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListEventLoading extends StatelessWidget {
  final EdgeInsets? padding;
  final int? length;
  const ListEventLoading({super.key, this.padding, this.length});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: length ?? 5,
        itemBuilder: (ctx, idx) {
          return const ItemEventLaoding();
        },
      ),
    );
  }
}

class ItemEventLaoding extends StatelessWidget {
  const ItemEventLaoding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            height: 100,
            child: Shimmer.fromColors(
              baseColor: context.colorScheme.surfaceContainerHigh,
              highlightColor: context.colorScheme.surfaceContainerLow,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SpaceWidth(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Shimmer.fromColors(
                  baseColor: context.colorScheme.surfaceContainerHigh,
                  highlightColor: context.colorScheme.surfaceContainerLow,
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                  ),
                ),
                const SpaceHeight(12),
                Shimmer.fromColors(
                  baseColor: context.colorScheme.surfaceContainerHigh,
                  highlightColor: context.colorScheme.surfaceContainerLow,
                  child: Container(
                    height: 15,
                    width: context.deviceWidth * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
