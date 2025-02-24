import 'package:dicoding_event/presentation/favorite/cubit/list_favorite_cubit.dart';
import 'package:dicoding_event/presentation/widgets/empty_data.dart';
import 'package:dicoding_event/presentation/widgets/error_message.dart';
import 'package:dicoding_event/presentation/widgets/event_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    context.read<ListFavoriteCubit>().loadEventFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ListFavoriteCubit, ListFavoriteState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox(),
              success: (events) {
                return EventList(
                  events: events,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                );
              },
              empty: () {
                return const EmptyData(message: 'No favorites found');
              },
              error: (message) => ErrorMessage(message: message),
            );
          },
        ),
      ),
    );
  }
}
