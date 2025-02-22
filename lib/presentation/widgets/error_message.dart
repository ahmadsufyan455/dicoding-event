import 'package:dicoding_event/core/constants/error_code.dart';
import 'package:dicoding_event/gen/assets.gen.dart';
import 'package:dicoding_event/presentation/widgets/empty_data.dart';
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;
  const ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return message == ErrorCode.noInternetConnection
        ? EmptyData(
          message: 'No internet connection',
          image: Assets.icons.noInternet.keyName,
        )
        : const Center(child: Text('Something went wrong'));
  }
}
