// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user3_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User3Comment _$User3CommentFromJson(Map<String, dynamic> json) => User3Comment(
      id: json['id'] as String?,
      message: json['message'] as String?,
      pressingTime: json['pressingTime'] as int?,
    );

Map<String, dynamic> _$User3CommentToJson(User3Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'pressingTime': instance.pressingTime,
    };
