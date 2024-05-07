import 'package:dart_api/models/item_type_model.dart';
import 'package:dart_api/models/player/player_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  final ItemTypeModel itemType;

  final int quality;

  final PlayerModel owner;

  ItemModel({required this.itemType, required this.quality, required this.owner});

  factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);

  Map get toJson => _$ItemModelToJson(this);
}
