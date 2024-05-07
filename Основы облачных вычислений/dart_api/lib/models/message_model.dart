import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  final String messageId;

  final int playerFrom;

  final int playerTo;

  final String messageText;

  MessageModel({required this.messageId, required this.playerFrom, required this.playerTo, required this.messageText});

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);

  Map get toJson => _$MessageModelToJson(this);
}
