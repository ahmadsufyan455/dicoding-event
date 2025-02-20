import 'package:dicoding_event/core/router/app_routes.dart';
import 'package:dicoding_event/presentation/finished/bloc/finished_bloc.dart';
import 'package:dicoding_event/presentation/upcoming/bloc/upcoming_bloc.dart';
import 'package:dicoding_event/presentation/widgets/event_list.dart';
import 'package:dicoding_event/presentation/widgets/home_carousel_image.dart';
import 'package:dicoding_event/presentation/widgets/shimmer/carousel_event_loading.dart';
import 'package:dicoding_event/presentation/widgets/shimmer/list_event_loading.dart';
import 'package:dicoding_event/presentation/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<FinishedBloc>().add(const FinishedEvent.started(limit: 5));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Dicoding Event', style: TextStyle(fontSize: 18)),
                        Text('Recommendation event for you!'),
                      ],
                    ),
                    IconButton(
                      onPressed: () => context.pushNamed(AppRoutes.search),
                      icon: const Icon(Icons.search),
                    ),
                  ],
                ),
                const SpaceHeight(16),
                BlocBuilder<UpcomingBloc, UpcomingState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox(),
                      loading: () => const CarouselEventLoading(),
                      success: (events) => HomeCarouselImage(events: events),
                      empty: () => const SizedBox(),
                      error: (message) => Text(message),
                    );
                  },
                ),
                const SpaceHeight(16),
                const Text(
                  'Finished Event',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SpaceHeight(16),
                BlocBuilder<FinishedBloc, FinishedState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox(),
                      loading: () => const ListEventLoading(),
                      success: (events) {
                        return EventList(
                          events: events,
                          physics: const NeverScrollableScrollPhysics(),
                        );
                      },
                      error: (message) => Text(message),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
