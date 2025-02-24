import 'package:dicoding_event/presentation/favorite/bloc/favorite_bloc.dart';
import 'package:dicoding_event/presentation/widgets/empty_data.dart';
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
    context.read<FavoriteBloc>().add(const FavoriteEvent.loadFavorites());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            return state.maybeWhen(
              successLoadFavorite: (events) {
                return EventList(
                  events: events,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                );
              },
              emptyFavorites: () {
                return const EmptyData(message: 'No favorites found');
              },
              orElse: () => const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
