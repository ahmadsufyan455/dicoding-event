import 'package:dicoding_event/core/error/failure.dart';
import 'package:dicoding_event/domain/repositories/event_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveEventFavorite {
  final EventRepository eventRepository;
  RemoveEventFavorite(this.eventRepository);

  Future<Either<Failure, String>> invoke(int id) async {
    return await eventRepository.removeEventFavorite(id);
  }
}
