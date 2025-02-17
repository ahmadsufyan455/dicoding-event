import 'package:dicoding_event/core/error/failure.dart';
import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:dicoding_event/domain/repositories/event_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetUpcomingEvents {
  final EventRepository eventRepository;
  GetUpcomingEvents(this.eventRepository);

  Future<Either<Failure, List<EventEntity>>> invoke({int? limit}) async {
    return await eventRepository.getEvents(1, limit: limit);
  }
}
