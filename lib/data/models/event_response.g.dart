// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventResponse _$EventResponseFromJson(Map<String, dynamic> json) =>
    EventResponse(
      error: json['error'] as bool,
      message: json['message'] as String,
      listEvents:
          (json['listEvents'] as List<dynamic>)
              .map((e) => Event.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$EventResponseToJson(EventResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'listEvents': instance.listEvents,
    };

Event _$EventFromJson(Map<String, dynamic> json) => Event(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  summary: json['summary'] as String,
  description: json['description'] as String,
  imageLogo: json['imageLogo'] as String,
  mediaCover: json['mediaCover'] as String,
  category: json['category'] as String,
  ownerName: json['ownerName'] as String,
  cityName: json['cityName'] as String,
  quota: (json['quota'] as num).toInt(),
  registrants: (json['registrants'] as num).toInt(),
  beginTime: json['beginTime'] as String,
  endTime: json['endTime'] as String,
  link: json['link'] as String,
);

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'summary': instance.summary,
  'description': instance.description,
  'imageLogo': instance.imageLogo,
  'mediaCover': instance.mediaCover,
  'category': instance.category,
  'ownerName': instance.ownerName,
  'cityName': instance.cityName,
  'quota': instance.quota,
  'registrants': instance.registrants,
  'beginTime': instance.beginTime,
  'endTime': instance.endTime,
  'link': instance.link,
};
