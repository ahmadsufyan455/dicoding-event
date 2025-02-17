part of 'finished_bloc.dart';

@freezed
class FinishedEvent with _$FinishedEvent {
  const factory FinishedEvent.started({int? limit}) = _Started;
}
