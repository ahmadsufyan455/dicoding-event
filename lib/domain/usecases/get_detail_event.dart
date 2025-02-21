import 'package:dicoding_event/core/error/failure.dart';
import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:dicoding_event/domain/repositories/event_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetDetailEvent {
  final EventRepository eventRepository;
  GetDetailEvent(this.eventRepository);

  Future<Either<Failure, EventEntity>> invoke(int id) async {
    return await eventRepository.getDetailEvent(id);
  }
}
