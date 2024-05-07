import 'package:json_annotation/json_annotation.dart';

part 'item_type_model.g.dart';

@JsonSerializable()
class ItemTypeModel {
  final int id;

  final String name;

  ItemTypeModel({required this.id, required this.name});

  factory ItemTypeModel.fromJson(Map<String, dynamic> json) => _$ItemTypeModelFromJson(json);

  Map get toJson => _$ItemTypeModelToJson(this);
}
