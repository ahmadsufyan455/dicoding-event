import 'package:dicoding_event/presentation/finished/bloc/finished_bloc.dart';
import 'package:dicoding_event/presentation/widgets/error_message.dart';
import 'package:dicoding_event/presentation/widgets/event_list.dart';
import 'package:dicoding_event/presentation/widgets/shimmer/list_event_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinishedScreen extends StatefulWidget {
  const FinishedScreen({super.key});

  @override
  State<FinishedScreen> createState() => _FinishedScreenState();
}

class _FinishedScreenState extends State<FinishedScreen> {
  @override
  void initState() {
    context.read<FinishedBloc>().add(const FinishedEvent.started());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FinishedBloc, FinishedState>(
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
              error: (message) => ErrorMessage(message: message),
            );
          },
        ),
      ),
    );
  }
}
