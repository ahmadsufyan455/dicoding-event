import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:dicoding_event/domain/usecases/get_event_favorites.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_favorite_cubit.freezed.dart';
part 'list_favorite_state.dart';

class ListFavoriteCubit extends Cubit<ListFavoriteState> {
  final GetEventFavorites _getEventFavorites;
  ListFavoriteCubit({required GetEventFavorites getEventFavorites})
    : _getEventFavorites = getEventFavorites,
      super(const ListFavoriteState.initial());

  void loadEventFavorites() async {
    final result = await _getEventFavorites.invoke();
    result.fold((failure) => (_Error(failure.message)), (data) {
      if (data.isNotEmpty) {
        emit(_Success(data));
      } else {
        emit(const _Empty());
      }
    });
  }
}
