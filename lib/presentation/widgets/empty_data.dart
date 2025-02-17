import 'package:dicoding_event/gen/assets.gen.dart';
import 'package:dicoding_event/presentation/widgets/spaces.dart';
import 'package:flutter/material.dart';

class EmptyData extends StatelessWidget {
  final String message;
  const EmptyData({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.icons.empty.keyName),
          const SpaceHeight(16),
          Text(message, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
