// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      itemType:
          ItemTypeModel.fromJson(json['itemType'] as Map<String, dynamic>),
      quality: json['quality'] as int,
      owner: PlayerModel.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'itemType': instance.itemType,
      'quality': instance.quality,
      'owner': instance.owner,
    };
