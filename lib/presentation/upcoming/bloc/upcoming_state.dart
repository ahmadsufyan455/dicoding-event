part of 'upcoming_bloc.dart';

@freezed
class UpcomingState with _$UpcomingState {
  const factory UpcomingState.initial() = _Initial;
  const factory UpcomingState.loading() = _Loading;
  const factory UpcomingState.success(List<EventEntity> events) = _Success;
  const factory UpcomingState.empty() = _Empty;
  const factory UpcomingState.error(String message) = _Error;
}
