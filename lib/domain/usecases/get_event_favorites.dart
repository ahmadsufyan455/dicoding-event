import 'package:dicoding_event/core/error/failure.dart';
import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:dicoding_event/domain/repositories/event_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetEventFavorites {
  final EventRepository eventRepository;
  GetEventFavorites(this.eventRepository);

  Future<Either<Failure, List<EventEntity>>> invoke() async {
    return await eventRepository.getEventFavorites();
  }
}
