part of 'list_favorite_cubit.dart';

@freezed
class ListFavoriteState with _$ListFavoriteState {
  const factory ListFavoriteState.initial() = _Initial;
  const factory ListFavoriteState.empty() = _Empty;
  const factory ListFavoriteState.success(List<EventEntity> events) = _Success;
  const factory ListFavoriteState.error(String message) = _Error;
}
