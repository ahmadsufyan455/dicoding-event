import 'package:dicoding_event/gen/assets.gen.dart';
import 'package:dicoding_event/presentation/widgets/spaces.dart';
import 'package:flutter/material.dart';

class EmptyData extends StatelessWidget {
  final String message;
  final String? image;
  const EmptyData({super.key, required this.message, this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image ?? Assets.icons.empty.keyName),
          const SpaceHeight(16),
          Text(message, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
