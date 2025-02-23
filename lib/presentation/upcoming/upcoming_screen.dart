import 'package:dicoding_event/core/extensions/build_context_ext.dart';
import 'package:dicoding_event/presentation/upcoming/bloc/upcoming_bloc.dart';
import 'package:dicoding_event/presentation/widgets/empty_data.dart';
import 'package:dicoding_event/presentation/widgets/error_message.dart';
import 'package:dicoding_event/presentation/widgets/event_list.dart';
import 'package:dicoding_event/presentation/widgets/shimmer/list_event_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({super.key});

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  @override
  void initState() {
    context.read<UpcomingBloc>().add(const UpcomingEvent.started());
    super.initState();
  }

  Future<void> _onRefresh() async {
    context.read<UpcomingBloc>().add(const UpcomingEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => _onRefresh(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: BlocBuilder<UpcomingBloc, UpcomingState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox(),
                  loading: () {
                    return const ListEventLoading(
                      padding: EdgeInsets.all(16),
                      length: 10,
                    );
                  },
                  success: (events) {
                    return EventList(
                      events: events,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    );
                  },
                  empty: () {
                    return SizedBox(
                      height: context.deviceHeight,
                      child: const EmptyData(
                        message: 'There are no upcoming events yet!',
                      ),
                    );
                  },
                  error:
                      (message) => SizedBox(
                        height: context.deviceHeight,
                        child: ErrorMessage(message: message),
                      ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
