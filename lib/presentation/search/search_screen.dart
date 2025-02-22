import 'package:dicoding_event/gen/assets.gen.dart';
import 'package:dicoding_event/presentation/search/bloc/search_bloc.dart';
import 'package:dicoding_event/presentation/search/widgets/search_input.dart';
import 'package:dicoding_event/presentation/widgets/empty_data.dart';
import 'package:dicoding_event/presentation/widgets/error_message.dart';
import 'package:dicoding_event/presentation/widgets/event_list.dart';
import 'package:dicoding_event/presentation/widgets/shimmer/list_event_loading.dart';
import 'package:dicoding_event/presentation/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();

  @override
  void initState() {
    context.read<SearchBloc>().add(const SearchEvent.reset());
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SearchInput(
                controller: searchController,
                onSearch:
                    (query) => context.read<SearchBloc>().add(
                      SearchEvent.started(query),
                    ),
              ),
              const SpaceHeight(16),
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    return state.when(
                      initial:
                          () => EmptyData(
                            message: 'Search your events...',
                            image: Assets.icons.search.keyName,
                          ),
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
                        return const EmptyData(message: 'No events found!');
                      },
                      error: (message) => ErrorMessage(message: message),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
