part of 'upcoming_bloc.dart';

@freezed
class UpcomingEvent with _$UpcomingEvent {
  const factory UpcomingEvent.started({int? limit}) = _Started;
}
