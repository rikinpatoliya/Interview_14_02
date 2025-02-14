import 'package:json_annotation/json_annotation.dart';

import 'location.dart';

part 'value.g.dart';

@JsonSerializable()
class Value {
  Location? location;
  @JsonKey(name: 'location_name')
  String? locationName;
  List<double>? coordinates;
  @JsonKey(name: 'sort_key')
  int? sortKey;

  Value({this.location, this.locationName, this.coordinates, this.sortKey});

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);

  Map<String, dynamic> toJson() => _$ValueToJson(this);
}
