import 'package:dicoding_event/core/extensions/build_context_ext.dart';
import 'package:dicoding_event/presentation/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailEventShimmer extends StatelessWidget {
  const DetailEventShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildShimmer(
            context,
            height: context.deviceHeight * 0.2,
            width: context.deviceWidth,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildShimmer(
                  context,
                  height: 30,
                  width: 100,
                  borderRadius: 12,
                ),
                const SpaceHeight(16),
                _buildShimmer(
                  context,
                  width: context.deviceWidth,
                  height: 20,
                  borderRadius: 10,
                ),
                const SpaceHeight(4),
                _buildShimmer(
                  context,
                  width: context.deviceWidth * 0.6,
                  height: 20,
                  borderRadius: 10,
                ),
                const SpaceHeight(16),
                Center(
                  child: _buildShimmer(
                    context,
                    width: context.deviceWidth * 0.5,
                    height: 20,
                    borderRadius: 10,
                  ),
                ),
                const SpaceHeight(16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 15,
                  itemBuilder: (ctx, idx) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: _buildShimmer(
                        context,
                        width: context.deviceWidth,
                        height: 20,
                        borderRadius: 10,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildShimmer(
  BuildContext context, {
  required double width,
  required double height,
  double? borderRadius,
}) {
  return Shimmer.fromColors(
    baseColor: context.colorScheme.surfaceContainerHigh,
    highlightColor: context.colorScheme.surfaceContainerLow,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
      ),
    ),
  );
}
