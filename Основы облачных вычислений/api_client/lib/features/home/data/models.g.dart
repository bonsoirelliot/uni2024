// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      json['id'] as int,
      ItemType.fromJson(json['itemType'] as Map<String, dynamic>),
      json['quality'] as int,
      json['ownerId'] as int,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'itemType': instance.itemType,
      'quality': instance.quality,
      'ownerId': instance.ownerId,
    };

ItemDTO _$ItemDTOFromJson(Map<String, dynamic> json) => ItemDTO(
      json['itemType'] as int,
      json['quality'] as int,
      json['ownerId'] as int,
    );

Map<String, dynamic> _$ItemDTOToJson(ItemDTO instance) => <String, dynamic>{
      'itemType': instance.itemType,
      'quality': instance.quality,
      'ownerId': instance.ownerId,
    };

ItemType _$ItemTypeFromJson(Map<String, dynamic> json) => ItemType(
      json['id'] as int,
      json['name'] as String,
    );

Map<String, dynamic> _$ItemTypeToJson(ItemType instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ItemTypeDTO _$ItemTypeDTOFromJson(Map<String, dynamic> json) => ItemTypeDTO(
      json['name'] as String,
    );

Map<String, dynamic> _$ItemTypeDTOToJson(ItemTypeDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      json['id'] as int,
      json['description'] as String,
      $enumDecode(_$LocationTypeEnumMap, json['locationType']),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'locationType': _$LocationTypeEnumMap[instance.locationType]!,
    };

const _$LocationTypeEnumMap = {
  LocationType.Forest: 'Forest',
  LocationType.Desert: 'Desert',
  LocationType.Dungeon: 'Dungeon',
  LocationType.River: 'River',
  LocationType.Ocean: 'Ocean',
};

LocationDTO _$LocationDTOFromJson(Map<String, dynamic> json) => LocationDTO(
      json['description'] as String,
      $enumDecode(_$LocationTypeEnumMap, json['locationType']),
    );

Map<String, dynamic> _$LocationDTOToJson(LocationDTO instance) =>
    <String, dynamic>{
      'description': instance.description,
      'locationType': _$LocationTypeEnumMap[instance.locationType]!,
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      json['id'] as int,
      json['playerFromId'] as int,
      json['playerToId'] as int,
      json['messageText'] as String,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'playerFromId': instance.playerFromId,
      'playerToId': instance.playerToId,
      'messageText': instance.messageText,
    };

MessageDTO _$MessageDTOFromJson(Map<String, dynamic> json) => MessageDTO(
      json['playerFromId'] as int,
      json['playerToId'] as int,
      json['messageText'] as String,
    );

Map<String, dynamic> _$MessageDTOToJson(MessageDTO instance) =>
    <String, dynamic>{
      'playerFromId': instance.playerFromId,
      'playerToId': instance.playerToId,
      'messageText': instance.messageText,
    };

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
      json['id'] as int,
      json['name'] as String,
      $enumDecode(_$PlayerClassEnumMap, json['playerClass']),
      json['email'] as String,
      json['level'] as int,
      json['position'] as int,
    );

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'playerClass': _$PlayerClassEnumMap[instance.playerClass]!,
      'email': instance.email,
      'level': instance.level,
      'position': instance.position,
    };

const _$PlayerClassEnumMap = {
  PlayerClass.Knight: 'Knight',
  PlayerClass.Wizard: 'Wizard',
  PlayerClass.Thief: 'Thief',
  PlayerClass.Paladin: 'Paladin',
};

PlayerDTO _$PlayerDTOFromJson(Map<String, dynamic> json) => PlayerDTO(
      json['name'] as String,
      $enumDecode(_$PlayerClassEnumMap, json['playerClass']),
      json['email'] as String,
      json['level'] as int,
      json['position'] as int,
    );

Map<String, dynamic> _$PlayerDTOToJson(PlayerDTO instance) => <String, dynamic>{
      'name': instance.name,
      'playerClass': _$PlayerClassEnumMap[instance.playerClass]!,
      'email': instance.email,
      'level': instance.level,
      'position': instance.position,
    };
