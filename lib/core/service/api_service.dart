import 'package:dicoding_event/data/models/detail_event_response.dart';
import 'package:dicoding_event/data/models/event_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://event-api.dicoding.dev/')
abstract interface class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @GET('events')
  Future<EventResponse> getEvents({
    @Query('active') int active = 0,
    @Query('limit') int? limit = 40,
    @Query('q') String? query = '',
  });

  @GET('events/{id}')
  Future<DetailEventResponse> getDetailEvent(@Path('id') int id);
}
