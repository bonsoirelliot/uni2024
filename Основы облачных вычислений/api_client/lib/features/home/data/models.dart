import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class Item {
  int id;
  ItemType itemType;
  int quality;
  int ownerId;

  Item(this.id, this.itemType, this.quality, this.ownerId);

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class ItemDTO {
  int itemType;
  int quality;
  int ownerId;

  ItemDTO(this.itemType, this.quality, this.ownerId);

  factory ItemDTO.fromJson(Map<String, dynamic> json) => _$ItemDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDTOToJson(this);
}

@JsonSerializable()
class ItemType {
  int id;
  String name;

  ItemType(this.id, this.name);

  factory ItemType.fromJson(Map<String, dynamic> json) => _$ItemTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ItemTypeToJson(this);
}

@JsonSerializable()
class ItemTypeDTO {
  String name;

  ItemTypeDTO(this.name);

  factory ItemTypeDTO.fromJson(Map<String, dynamic> json) => _$ItemTypeDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ItemTypeDTOToJson(this);
}

@JsonSerializable()
class Location {
  int id;
  String description;
  LocationType locationType;

  Location(this.id, this.description, this.locationType);

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class LocationDTO {
  String description;
  LocationType locationType;

  LocationDTO(this.description, this.locationType);

  factory LocationDTO.fromJson(Map<String, dynamic> json) => _$LocationDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDTOToJson(this);
}

enum LocationType {
  Forest,
  Desert,
  Dungeon,
  River,
  Ocean
}

@JsonSerializable()
class Message {
  int id;
  int playerFromId;
  int playerToId;
  String messageText;

  Message(this.id, this.playerFromId, this.playerToId, this.messageText);

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

@JsonSerializable()
class MessageDTO {
  int playerFromId;
  int playerToId;
  String messageText;

  MessageDTO(this.playerFromId, this.playerToId, this.messageText);

  factory MessageDTO.fromJson(Map<String, dynamic> json) => _$MessageDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MessageDTOToJson(this);
}

@JsonSerializable()
class Player {
  int id;
  String name;
  PlayerClass playerClass;
  String email;
  int level;
  int position;

  Player(this.id, this.name, this.playerClass, this.email, this.level, this.position);

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}

@JsonSerializable()
class PlayerDTO {
  String name;
  PlayerClass playerClass;
  String email;
  int level;
  int position;

  PlayerDTO(this.name, this.playerClass, this.email, this.level, this.position);

  factory PlayerDTO.fromJson(Map<String, dynamic> json) => _$PlayerDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerDTOToJson(this);
}

enum PlayerClass {
  Knight,
  Wizard,
  Thief,
  Paladin
}
