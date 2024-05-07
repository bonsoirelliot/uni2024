// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      messageId: json['messageId'] as String,
      playerFrom: json['playerFrom'] as int,
      playerTo: json['playerTo'] as int,
      messageText: json['messageText'] as String,
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'playerFrom': instance.playerFrom,
      'playerTo': instance.playerTo,
      'messageText': instance.messageText,
    };
