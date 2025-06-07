import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:dicoding_event/domain/usecases/get_favorite_status.dart';
import 'package:dicoding_event/domain/usecases/insert_event_favorite.dart';
import 'package:dicoding_event/domain/usecases/remove_event_favorite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'favorite_bloc.freezed.dart';
part 'favorite_event.dart';
part 'favorite_state.dart';

@injectable
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final InsertEventFavorite _insertEventFavorite;
  final RemoveEventFavorite _removeEventFavorite;
  final GetFavoriteStatus _getFavoriteStatus;

  FavoriteBloc({
    required InsertEventFavorite insertEventFavorite,
    required RemoveEventFavorite removeEventFavorite,
    required GetFavoriteStatus getFavoriteStatus,
  }) : _insertEventFavorite = insertEventFavorite,
       _removeEventFavorite = removeEventFavorite,
       _getFavoriteStatus = getFavoriteStatus,
       super(const _Initial()) {
    on<_AddToFavorite>((event, emit) async {
      final result = await _insertEventFavorite.invoke(event.data);
      result.fold(
        (failure) => emit(_FailedMessage(failure.message)),
        (_) => emit(const _SuccessMessage('Added to favorite')),
      );
    });

    on<_RemoveFromFavorite>((event, emit) async {
      final result = await _removeEventFavorite.invoke(event.id);
      result.fold(
        (failure) => emit(_FailedMessage(failure.message)),
        (_) => emit(const _SuccessMessage('Removed from favorite')),
      );
    });

    on<_LoadFavoriteStatus>((event, emit) async {
      final isFavorite = await _getFavoriteStatus.invoke(event.id);
      emit(_FavoriteStatus(isFavorite));
    });
  }
}
