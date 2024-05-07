// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      locationId: json['locationId'] as String,
      description: json['description'] as String,
      locationType: $enumDecode(_$LocationTypeEnumMap, json['locationType']),
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'locationId': instance.locationId,
      'description': instance.description,
      'locationType': _$LocationTypeEnumMap[instance.locationType]!,
    };

const _$LocationTypeEnumMap = {
  LocationType.forest: 'forest',
  LocationType.desert: 'desert',
  LocationType.dungeon: 'dungeon',
  LocationType.river: 'river',
  LocationType.ocean: 'ocean',
};
