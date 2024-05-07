import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  final String locationId;

  final String description;

  final LocationType locationType;

  LocationModel({required this.locationId, required this.description, required this.locationType});

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);

  Map get toJson => _$LocationModelToJson(this);
}

enum LocationType { forest, desert, dungeon, river, ocean }
