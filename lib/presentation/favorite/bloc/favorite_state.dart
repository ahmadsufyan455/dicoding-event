part of 'favorite_bloc.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = _Initial;
  const factory FavoriteState.successMessage(String message) = _SuccessMessage;
  const factory FavoriteState.failedMessage(String message) = _FailedMessage;
  const factory FavoriteState.favoriteStatus(bool isFavorite) = _FavoriteStatus;
}
