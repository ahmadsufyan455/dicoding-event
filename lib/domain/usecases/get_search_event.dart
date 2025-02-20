import 'package:dicoding_event/core/error/failure.dart';
import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:dicoding_event/domain/repositories/event_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetSearchEvent {
  final EventRepository eventRepository;
  GetSearchEvent(this.eventRepository);

  Future<Either<Failure, List<EventEntity>>> invoke(String query) async {
    return await eventRepository.getEvents(-1, query: query);
  }
}
