import 'package:dart_api/models/player/player_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'player_dto.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class PlayerDto {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final PlayerClass playerClass;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final int level;

  @HiveField(4)
  final String position;

  PlayerDto({
    required this.name,
    required this.playerClass,
    required this.email,
    required this.level,
    required this.position,
  });

  factory PlayerDto.fromJson(Map<String, dynamic> json) => _$PlayerDtoFromJson(json);

  Map get toJson => _$PlayerDtoToJson(this);
}
