import 'package:dicoding_event/domain/repositories/event_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFavoriteStatus {
  final EventRepository eventRepository;
  GetFavoriteStatus(this.eventRepository);

  Future<bool> invoke(int id) => eventRepository.isAddedToFavorite(id);
}
