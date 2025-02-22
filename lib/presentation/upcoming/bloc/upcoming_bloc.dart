import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:dicoding_event/domain/usecases/get_upcoming_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upcoming_bloc.freezed.dart';
part 'upcoming_event.dart';
part 'upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  final GetUpcomingEvents _getUpcomingEvents;
  UpcomingBloc({required GetUpcomingEvents getUpcomingEvents})
    : _getUpcomingEvents = getUpcomingEvents,
      super(const _Initial()) {
    on<_Started>((event, emit) async {
      emit(const _Loading());
      final result = await _getUpcomingEvents.invoke(limit: event.limit);
      result.fold((failure) => emit(_Error(failure.message)), (events) {
        events.isEmpty ? emit(const _Empty()) : emit(_Success(events));
      });
    });
  }
}
