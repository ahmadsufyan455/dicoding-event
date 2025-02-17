import 'package:dicoding_event/data/models/base_response.dart';
import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_response.g.dart';

@JsonSerializable()
class EventResponse extends BaseResponse {
  final List<Event> listEvents;
  EventResponse({
    required super.error,
    required super.message,
    required this.listEvents,
  });

  factory EventResponse.fromJson(Map<String, dynamic> json) =>
      _$EventResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EventResponseToJson(this);
}

@JsonSerializable()
class Event extends EventEntity {
  Event({
    required super.id,
    required super.name,
    required super.summary,
    required super.description,
    required super.imageLogo,
    required super.mediaCover,
    required super.category,
    required super.ownerName,
    required super.cityName,
    required super.quota,
    required super.registrants,
    required super.beginTime,
    required super.endTime,
    required super.link,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
