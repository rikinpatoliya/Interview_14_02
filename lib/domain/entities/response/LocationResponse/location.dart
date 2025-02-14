import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  String? suggestion;
  String? district;
  double? lat;
  String? location;
  double? lon;
  String? state;
  String? label;
  int? score;
  double? pincode;

  Location({
    this.suggestion,
    this.district,
    this.lat,
    this.location,
    this.lon,
    this.state,
    this.label,
    this.score,
    this.pincode,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
