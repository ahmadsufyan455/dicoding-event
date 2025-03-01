part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.started(String query) = _Started;
  const factory SearchEvent.reset() = _Reset;
}
