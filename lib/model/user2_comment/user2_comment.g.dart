// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user2_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User2Comment _$User2CommentFromJson(Map<String, dynamic> json) => User2Comment(
      id: json['id'] as String?,
      message: json['message'] as String?,
      pressingTime: json['pressingTime'] as int?,
    );

Map<String, dynamic> _$User2CommentToJson(User2Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'pressingTime': instance.pressingTime,
    };
