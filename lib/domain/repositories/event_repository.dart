import 'package:dicoding_event/core/error/failure.dart';
import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class EventRepository {
  Future<Either<Failure, List<EventEntity>>> getEvents(
    int active, {
    int? limit,
    String? query,
  });
}
