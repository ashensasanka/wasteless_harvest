// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user1_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User1Comment _$User1CommentFromJson(Map<String, dynamic> json) => User1Comment(
      id: json['id'] as String?,
      message: json['message'] as String?,
      pressingTime: json['pressingTime'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$User1CommentToJson(User1Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'pressingTime': instance.pressingTime,
      'name': instance.name,
    };
