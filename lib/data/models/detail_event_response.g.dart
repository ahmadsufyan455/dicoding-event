// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_event_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailEventResponse _$DetailEventResponseFromJson(Map<String, dynamic> json) =>
    DetailEventResponse(
      error: json['error'] as bool,
      message: json['message'] as String,
      event: Event.fromJson(json['event'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailEventResponseToJson(
  DetailEventResponse instance,
) => <String, dynamic>{
  'error': instance.error,
  'message': instance.message,
  'event': instance.event,
};
