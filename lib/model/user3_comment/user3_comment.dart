import 'package:json_annotation/json_annotation.dart';
part 'user3_comment.g.dart';

@JsonSerializable()
class User3Comment {
  @JsonKey(name:"id")
  String? id;

  @JsonKey(name:"message")
  String? message;

  @JsonKey(name:"pressingTime")
  int? pressingTime;

  User3Comment({
    this.id,
    this.message,
    this.pressingTime
  });

  factory User3Comment.fromJson(Map<String, dynamic> json) => _$User3CommentFromJson(json);

  Map<String, dynamic> toJson() => _$User3CommentToJson(this);

}