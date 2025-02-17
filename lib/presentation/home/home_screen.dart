import 'package:dicoding_event/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed:
              () => context.pushNamed(
                AppRoutes.detail,
                pathParameters: {'id': '0123'},
              ),
          child: const Text('Navigate to detail'),
        ),
      ),
    );
  }
}
