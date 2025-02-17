part of 'finished_bloc.dart';

@freezed
class FinishedState with _$FinishedState {
  const factory FinishedState.initial() = _Initial;
  const factory FinishedState.loading() = _Loading;
  const factory FinishedState.success(List<EventEntity> events) = _Success;
  const factory FinishedState.error(String error) = _Error;
}
