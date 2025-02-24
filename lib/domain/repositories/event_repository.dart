import 'package:dicoding_event/core/error/failure.dart';
import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class EventRepository {
  Future<Either<Failure, List<EventEntity>>> getEvents(
    int active, {
    int? limit,
    String? query,
  });

  Future<Either<Failure, EventEntity>> getDetailEvent(int id);

  Future<Either<Failure, String>> insertEventFavorite(EventEntity event);
  Future<Either<Failure, String>> removeEventFavorite(int id);
  Future<bool> isAddedToFavorite(int id);
  Future<Either<Failure, List<EventEntity>>> getEventFavorites();
}
