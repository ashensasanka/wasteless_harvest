// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateComment _$RateCommentFromJson(Map<String, dynamic> json) => RateComment(
      id: json['id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RateCommentToJson(RateComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'rate': instance.rate,
    };
