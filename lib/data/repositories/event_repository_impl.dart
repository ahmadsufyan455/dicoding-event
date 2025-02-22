import 'package:dicoding_event/core/constants/error_code.dart';
import 'package:dicoding_event/core/error/failure.dart';
import 'package:dicoding_event/core/helper/connection_check.dart';
import 'package:dicoding_event/core/service/api_service.dart';
import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:dicoding_event/domain/repositories/event_repository.dart';
import 'package:fpdart/fpdart.dart';

class EventRepositoryImpl implements EventRepository {
  final ApiService apiService;
  EventRepositoryImpl(this.apiService);

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
}
