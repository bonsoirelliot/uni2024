// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayerDtoAdapter extends TypeAdapter<PlayerDto> {
  @override
  final int typeId = 0;

  @override
  PlayerDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlayerDto(
      name: fields[0] as String,
      playerClass: fields[1] as PlayerClass,
      email: fields[2] as String,
      level: fields[3] as int,
      position: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PlayerDto obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.playerClass)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.level)
      ..writeByte(4)
      ..write(obj.position);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayerDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerDto _$PlayerDtoFromJson(Map<String, dynamic> json) => PlayerDto(
      name: json['name'] as String,
      playerClass: $enumDecode(_$PlayerClassEnumMap, json['playerClass']),
      email: json['email'] as String,
      level: json['level'] as int,
      position: json['position'] as String,
    );

Map<String, dynamic> _$PlayerDtoToJson(PlayerDto instance) => <String, dynamic>{
      'name': instance.name,
      'playerClass': _$PlayerClassEnumMap[instance.playerClass]!,
      'email': instance.email,
      'level': instance.level,
      'position': instance.position,
    };

const _$PlayerClassEnumMap = {
  PlayerClass.knight: 'knight',
  PlayerClass.wizard: 'wizard',
  PlayerClass.thief: 'thief',
  PlayerClass.paladin: 'paladin',
};
