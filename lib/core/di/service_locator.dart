import 'package:dicoding_event/core/service/api_service.dart';
import 'package:dicoding_event/data/repositories/event_repository_impl.dart';
import 'package:dicoding_event/domain/repositories/event_repository.dart';
import 'package:dicoding_event/domain/usecases/get_finished_events.dart';
import 'package:dicoding_event/presentation/finished/bloc/finished_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  serviceLocator.registerFactory(
    () => FinishedBloc(getFinishedEvents: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetFinishedEvents(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<EventRepository>(
    () => EventRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(() => ApiService(serviceLocator()));
  serviceLocator.registerLazySingleton(() => Dio());
}
