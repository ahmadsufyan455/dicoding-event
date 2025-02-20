part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.success(List<EventEntity> events) = _Success;
  const factory SearchState.empty() = _Empty;
  const factory SearchState.error(String message) = _Error;
}
