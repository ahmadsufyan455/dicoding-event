// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dicoding_event/core/di/injectable_module.dart' as _i299;
import 'package:dicoding_event/core/service/api_service.dart' as _i7;
import 'package:dicoding_event/data/local/database/database_service.dart'
    as _i1034;
import 'package:dicoding_event/data/repositories/event_repository_impl.dart'
    as _i571;
import 'package:dicoding_event/domain/repositories/event_repository.dart'
    as _i938;
import 'package:dicoding_event/domain/usecases/get_detail_event.dart' as _i461;
import 'package:dicoding_event/domain/usecases/get_event_favorites.dart'
    as _i306;
import 'package:dicoding_event/domain/usecases/get_favorite_status.dart'
    as _i30;
import 'package:dicoding_event/domain/usecases/get_finished_events.dart'
    as _i368;
import 'package:dicoding_event/domain/usecases/get_search_event.dart' as _i156;
import 'package:dicoding_event/domain/usecases/get_upcoming_events.dart'
    as _i775;
import 'package:dicoding_event/domain/usecases/insert_event_favorite.dart'
    as _i1004;
import 'package:dicoding_event/domain/usecases/remove_event_favorite.dart'
    as _i407;
import 'package:dicoding_event/presentation/detail/bloc/detail_bloc.dart'
    as _i613;
import 'package:dicoding_event/presentation/favorite/bloc/favorite_bloc.dart'
    as _i705;
import 'package:dicoding_event/presentation/favorite/cubit/list_favorite_cubit.dart'
    as _i829;
import 'package:dicoding_event/presentation/finished/bloc/finished_bloc.dart'
    as _i1028;
import 'package:dicoding_event/presentation/search/bloc/search_bloc.dart'
    as _i786;
import 'package:dicoding_event/presentation/upcoming/bloc/upcoming_bloc.dart'
    as _i183;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dio());
    gh.lazySingleton<_i1034.DatabaseService>(() => _i1034.DatabaseService());
    gh.factory<String>(() => injectableModule.baseUrl, instanceName: 'baseUrl');
    gh.lazySingleton<_i7.ApiService>(
      () => _i7.ApiService(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'baseUrl'),
      ),
    );
    gh.lazySingleton<_i938.EventRepository>(
      () => _i571.EventRepositoryImpl(
        gh<_i7.ApiService>(),
        gh<_i1034.DatabaseService>(),
      ),
    );
    gh.factory<_i461.GetDetailEvent>(
      () => _i461.GetDetailEvent(gh<_i938.EventRepository>()),
    );
    gh.factory<_i368.GetFinishedEvents>(
      () => _i368.GetFinishedEvents(gh<_i938.EventRepository>()),
    );
    gh.factory<_i1004.InsertEventFavorite>(
      () => _i1004.InsertEventFavorite(gh<_i938.EventRepository>()),
    );
    gh.factory<_i775.GetUpcomingEvents>(
      () => _i775.GetUpcomingEvents(gh<_i938.EventRepository>()),
    );
    gh.factory<_i407.RemoveEventFavorite>(
      () => _i407.RemoveEventFavorite(gh<_i938.EventRepository>()),
    );
    gh.factory<_i156.GetSearchEvent>(
      () => _i156.GetSearchEvent(gh<_i938.EventRepository>()),
    );
    gh.factory<_i30.GetFavoriteStatus>(
      () => _i30.GetFavoriteStatus(gh<_i938.EventRepository>()),
    );
    gh.factory<_i306.GetEventFavorites>(
      () => _i306.GetEventFavorites(gh<_i938.EventRepository>()),
    );
    gh.factory<_i183.UpcomingBloc>(
      () =>
          _i183.UpcomingBloc(getUpcomingEvents: gh<_i775.GetUpcomingEvents>()),
    );
    gh.factory<_i613.DetailBloc>(
      () => _i613.DetailBloc(getDetailEvent: gh<_i461.GetDetailEvent>()),
    );
    gh.factory<_i1028.FinishedBloc>(
      () =>
          _i1028.FinishedBloc(getFinishedEvents: gh<_i368.GetFinishedEvents>()),
    );
    gh.factory<_i829.ListFavoriteCubit>(
      () => _i829.ListFavoriteCubit(
        getEventFavorites: gh<_i306.GetEventFavorites>(),
      ),
    );
    gh.factory<_i705.FavoriteBloc>(
      () => _i705.FavoriteBloc(
        insertEventFavorite: gh<_i1004.InsertEventFavorite>(),
        removeEventFavorite: gh<_i407.RemoveEventFavorite>(),
        getFavoriteStatus: gh<_i30.GetFavoriteStatus>(),
      ),
    );
    gh.factory<_i786.SearchBloc>(
      () => _i786.SearchBloc(getSearchEvent: gh<_i156.GetSearchEvent>()),
    );
    return this;
  }
}

class _$InjectableModule extends _i299.InjectableModule {}
