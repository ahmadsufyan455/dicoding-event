import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_favorite_table.g.dart';

@JsonSerializable()
class EventFavoriteTable extends EventEntity {
  EventFavoriteTable({
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

  factory EventFavoriteTable.fromEntity(EventEntity event) {
    return EventFavoriteTable(
      id: event.id,
      name: event.name,
      summary: event.summary,
      description: event.description,
      imageLogo: event.imageLogo,
      mediaCover: event.mediaCover,
      category: event.category,
      ownerName: event.ownerName,
      cityName: event.cityName,
      quota: event.quota,
      registrants: event.registrants,
      beginTime: event.beginTime,
      endTime: event.endTime,
      link: event.link,
    );
  }

  factory EventFavoriteTable.fromJson(Map<String, dynamic> json) =>
      _$EventFavoriteTableFromJson(json);

  Map<String, dynamic> toJson() => _$EventFavoriteTableToJson(this);
}
