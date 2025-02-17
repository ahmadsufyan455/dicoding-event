import 'package:dicoding_event/presentation/finished/bloc/finished_bloc.dart';
import 'package:dicoding_event/presentation/widgets/event_list.dart';
import 'package:dicoding_event/presentation/widgets/home_carousel_image.dart';
import 'package:dicoding_event/presentation/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                const Text('Dicoding Event', style: TextStyle(fontSize: 18)),
                const Text('Recommendation event for you!'),
                const SpaceHeight(16),
                BlocBuilder<FinishedBloc, FinishedState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox(),
                      loading: () => const CircularProgressIndicator(),
                      success: (events) => HomeCarouselImage(events: events),
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
                      loading: () => const CircularProgressIndicator(),
                      success:
                          (events) => EventList(
                            events: events,
                            physics: const NeverScrollableScrollPhysics(),
                          ),
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
