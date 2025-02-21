import 'package:dicoding_event/data/models/base_response.dart';
import 'package:dicoding_event/data/models/event_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail_event_response.g.dart';

@JsonSerializable()
class DetailEventResponse extends BaseResponse {
  final Event event;
  DetailEventResponse({
    required super.error,
    required super.message,
    required this.event,
  });

  factory DetailEventResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailEventResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DetailEventResponseToJson(this);
}
