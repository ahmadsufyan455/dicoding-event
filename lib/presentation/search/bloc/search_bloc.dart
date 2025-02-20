import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:dicoding_event/domain/usecases/get_search_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchEvent _getSearchEvent;
  SearchBloc({required GetSearchEvent getSearchEvent})
    : _getSearchEvent = getSearchEvent,
      super(const _Initial()) {
    on<_Started>((event, emit) async {
      emit(const _Loading());
      final result = await _getSearchEvent.invoke(event.query);
      result.fold((failure) => emit(_Error(failure.message)), (events) {
        if (events.isEmpty) {
          emit(const _Empty());
        } else {
          emit(_Success(events));
        }
      });
    });

    on<_Reset>((event, emit) {
      emit(const _Initial());
    });
  }
}
