import 'package:dicoding_event/core/error/failure.dart';
import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:dicoding_event/domain/repositories/event_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class InsertEventFavorite {
  final EventRepository eventRepository;
  InsertEventFavorite(this.eventRepository);

  Future<Either<Failure, String>> invoke(EventEntity event) async {
    return await eventRepository.insertEventFavorite(event);
  }
}
