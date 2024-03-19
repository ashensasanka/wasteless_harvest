import 'package:json_annotation/json_annotation.dart';
part 'user2_comment.g.dart';

@JsonSerializable()
class User2Comment {
  @JsonKey(name:"id")
  String? id;

  @JsonKey(name:"message")
  String? message;

  @JsonKey(name:"pressingTime")
  int? pressingTime;

  User2Comment({
    this.id,
    this.message,
    this.pressingTime
  });

  factory User2Comment.fromJson(Map<String, dynamic> json) => _$User2CommentFromJson(json);

  Map<String, dynamic> toJson() => _$User2CommentToJson(this);

}