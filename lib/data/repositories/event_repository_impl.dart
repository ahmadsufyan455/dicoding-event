import 'package:dicoding_event/core/error/failure.dart';
import 'package:dicoding_event/core/service/api_service.dart';
import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:dicoding_event/domain/repositories/event_repository.dart';
import 'package:fpdart/fpdart.dart';

class EventRepositoryImpl implements EventRepository {
  final ApiService apiService;
  EventRepositoryImpl(this.apiService);

  @override
  Future<Either<Failure, List<EventEntity>>> getFinishedEvents() async {
    try {
      final result = await apiService.getFinishedEvents();
      return right(result.listEvents);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
