import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:dicoding_event/domain/usecases/get_event_favorites.dart';
import 'package:dicoding_event/domain/usecases/get_favorite_status.dart';
import 'package:dicoding_event/domain/usecases/insert_event_favorite.dart';
import 'package:dicoding_event/domain/usecases/remove_event_favorite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_bloc.freezed.dart';
part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final InsertEventFavorite _insertEventFavorite;
  final RemoveEventFavorite _removeEventFavorite;
  final GetEventFavorites _getEventFavorites;
  final GetFavoriteStatus _getFavoriteStatus;

  FavoriteBloc({
    required InsertEventFavorite insertEventFavorite,
    required RemoveEventFavorite removeEventFavorite,
    required GetEventFavorites getEventFavorites,
    required GetFavoriteStatus getFavoriteStatus,
  }) : _insertEventFavorite = insertEventFavorite,
       _removeEventFavorite = removeEventFavorite,
       _getEventFavorites = getEventFavorites,
       _getFavoriteStatus = getFavoriteStatus,
       super(const _Initial()) {
    on<_AddToFavorite>((event, emit) async {
      final result = await _insertEventFavorite.invoke(event.data);
      result.fold((failure) => emit(_FailedMessage(failure.message)), (_) {
        emit(const _SuccessMessage('Added to favorite'));
        add(const FavoriteEvent.loadFavorites());
      });
    });

    on<_RemoveFromFavorite>((event, emit) async {
      final result = await _removeEventFavorite.invoke(event.id);
      result.fold((failure) => emit(_FailedMessage(failure.message)), (_) {
        emit(const _SuccessMessage('Removed from favorite'));
        add(const FavoriteEvent.loadFavorites());
      });
    });

    on<_LoadFavorites>((event, emit) async {
      final result = await _getEventFavorites.invoke();
      result.fold((failure) => emit(_FailedMessage(failure.message)), (data) {
        if (data.isNotEmpty) {
          emit(_SuccessLoadFavorite(data));
        } else {
          emit(const _EmptyFavorites());
        }
      });
    });

    on<_LoadFavoriteStatus>((event, emit) async {
      final isFavorite = await _getFavoriteStatus.invoke(event.id);
      emit(_FavoriteStatus(isFavorite));
    });

    on<_Reset>((event, emit) async {
      emit(const _Initial());
    });
  }
}
