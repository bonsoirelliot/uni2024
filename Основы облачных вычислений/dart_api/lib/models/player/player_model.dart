import 'package:dart_api/models/player/player_dto.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class PlayerModel extends PlayerDto {
  @HiveField(5)
  final int id;

  PlayerModel({
    required this.id,
    required super.name,
    required super.playerClass,
    required super.email,
    required super.level,
    required super.position,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) => _$PlayerModelFromJson(json);

  @override
  Map get toJson => _$PlayerModelToJson(this);
}

enum PlayerClass { knight, wizard, thief, paladin }
