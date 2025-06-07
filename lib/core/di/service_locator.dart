import 'package:dicoding_event/core/service/api_service.dart';
import 'package:dicoding_event/data/local/database/database_service.dart';
import 'package:dicoding_event/data/repositories/event_repository_impl.dart';
import 'package:dicoding_event/domain/repositories/event_repository.dart';
import 'package:dicoding_event/domain/usecases/get_detail_event.dart';
import 'package:dicoding_event/domain/usecases/get_event_favorites.dart';
import 'package:dicoding_event/domain/usecases/get_favorite_status.dart';
import 'package:dicoding_event/domain/usecases/get_finished_events.dart';
import 'package:dicoding_event/domain/usecases/get_search_event.dart';
import 'package:dicoding_event/domain/usecases/get_upcoming_events.dart';
import 'package:dicoding_event/domain/usecases/insert_event_favorite.dart';
import 'package:dicoding_event/domain/usecases/remove_event_favorite.dart';
import 'package:dicoding_event/presentation/detail/bloc/detail_bloc.dart';
import 'package:dicoding_event/presentation/favorite/bloc/favorite_bloc.dart';
import 'package:dicoding_event/presentation/favorite/cubit/list_favorite_cubit.dart';
import 'package:dicoding_event/presentation/finished/bloc/finished_bloc.dart';
import 'package:dicoding_event/presentation/search/bloc/search_bloc.dart';
import 'package:dicoding_event/presentation/upcoming/bloc/upcoming_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:network_logger/network_logger.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // blocs
  serviceLocator
    ..registerFactory(() => FinishedBloc(getFinishedEvents: serviceLocator()))
    ..registerFactory(() => UpcomingBloc(getUpcomingEvents: serviceLocator()))
    ..registerFactory(() => SearchBloc(getSearchEvent: serviceLocator()))
    ..registerFactory(() => DetailBloc(getDetailEvent: serviceLocator()))
    ..registerFactory(
      () => FavoriteBloc(
        insertEventFavorite: serviceLocator(),
        removeEventFavorite: serviceLocator(),
        getFavoriteStatus: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => ListFavoriteCubit(getEventFavorites: serviceLocator()),
    );

  // usecases
  serviceLocator
    ..registerLazySingleton(() => GetFinishedEvents(serviceLocator()))
    ..registerLazySingleton(() => GetUpcomingEvents(serviceLocator()))
    ..registerLazySingleton(() => GetSearchEvent(serviceLocator()))
    ..registerLazySingleton(() => GetDetailEvent(serviceLocator()))
    ..registerLazySingleton(() => GetEventFavorites(serviceLocator()))
    ..registerLazySingleton(() => InsertEventFavorite(serviceLocator()))
    ..registerLazySingleton(() => RemoveEventFavorite(serviceLocator()))
    ..registerLazySingleton(() => GetFavoriteStatus(serviceLocator()));

  // data
  serviceLocator.registerLazySingleton<EventRepository>(
    () => EventRepositoryImpl(serviceLocator(), serviceLocator()),
  );
  serviceLocator.registerLazySingleton(() => ApiService(serviceLocator()));
  serviceLocator.registerLazySingleton(() => DatabaseService());
  serviceLocator.registerLazySingleton(
    () => Dio()..interceptors.add(DioNetworkLogger()),
  );
}
