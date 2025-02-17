part of 'finished_bloc.dart';

@freezed
class FinishedEvent with _$FinishedEvent {
  const factory FinishedEvent.started() = _Started;
}