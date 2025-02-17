import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:dicoding_event/domain/usecases/get_finished_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'finished_bloc.freezed.dart';
part 'finished_event.dart';
part 'finished_state.dart';

class FinishedBloc extends Bloc<FinishedEvent, FinishedState> {
  final GetFinishedEvents _getFinishedEvents;
  FinishedBloc({required GetFinishedEvents getFinishedEvents})
    : _getFinishedEvents = getFinishedEvents,
      super(const _Initial()) {
    on<_Started>((event, emit) async {
      emit(const _Loading());
      final result = await _getFinishedEvents.invoke();
      result.fold(
        (failure) => emit(_Error(failure.message)),
        (events) => emit(_Success(events)),
      );
    });
  }
}
