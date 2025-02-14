import 'package:json_annotation/json_annotation.dart';

import 'value.dart';

part 'location_response.g.dart';

@JsonSerializable()
class LocationResponse {
  List<Value>? value;

  LocationResponse({this.value});

  factory LocationResponse.fromJson(Map<String, dynamic> json) {
    return _$LocationResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LocationResponseToJson(this);
}
