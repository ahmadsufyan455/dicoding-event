import 'package:dicoding_event/core/constants/error_code.dart';
import 'package:dicoding_event/core/error/failure.dart';
import 'package:dicoding_event/core/helper/connection_check.dart';
import 'package:dicoding_event/core/service/api_service.dart';
import 'package:dicoding_event/data/local/database/database_service.dart';
import 'package:dicoding_event/data/models/event_favorite_table.dart';
import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:dicoding_event/domain/repositories/event_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: EventRepository)
class EventRepositoryImpl implements EventRepository {
  final ApiService apiService;
  final DatabaseService databaseService;
  EventRepositoryImpl(this.apiService, this.databaseService);

  @override
  Future<Either<Failure, List<EventEntity>>> getEvents(
    int active, {
    int? limit,
    String? query,
  }) async {
    try {
      final isConnected = await hasInternet();
      if (!isConnected) {
        return left(Failure(ErrorCode.noInternetConnection));
      }
      final result = await apiService.getEvents(
        active: active,
        limit: limit,
        query: query,
      );
      return right(result.listEvents);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, EventEntity>> getDetailEvent(int id) async {
    try {
      final isConnected = await hasInternet();
      if (!isConnected) {
        return left(Failure(ErrorCode.noInternetConnection));
      }
      final result = await apiService.getDetailEvent(id);
      return right(result.event);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<EventEntity>>> getEventFavorites() async {
    try {
      final result = await databaseService.getEventFavorites();
      return right(result);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> insertEventFavorite(EventEntity event) async {
    try {
      final result = await databaseService.insertEventFavorite(
        EventFavoriteTable.fromEntity(event),
      );
      return right(result.toString());
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<bool> isAddedToFavorite(int id) async {
    final result = await databaseService.getEventFavoriteById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, String>> removeEventFavorite(int id) async {
    try {
      final result = await databaseService.removeEventFavorite(id);
      return right(result.toString());
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
