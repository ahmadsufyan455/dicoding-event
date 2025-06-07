import 'package:dicoding_event/core/error/failure.dart';
import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:dicoding_event/domain/repositories/event_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFinishedEvents {
  final EventRepository eventRepository;
  GetFinishedEvents(this.eventRepository);

  Future<Either<Failure, List<EventEntity>>> invoke({int? limit}) async {
    return await eventRepository.getEvents(0, limit: limit);
  }
}
