part of 'favorite_bloc.dart';

@freezed
class FavoriteEvent with _$FavoriteEvent {
  const factory FavoriteEvent.loadFavorites() = _LoadFavorites;
  const factory FavoriteEvent.addToFavorite(EventEntity data) = _AddToFavorite;
  const factory FavoriteEvent.removeFromFavorite(int id) = _RemoveFromFavorite;
  const factory FavoriteEvent.loadFavoriteStatus(int id) = _LoadFavoriteStatus;
}
