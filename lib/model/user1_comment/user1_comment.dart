import 'package:json_annotation/json_annotation.dart';
part 'user1_comment.g.dart';

@JsonSerializable()
class User1Comment {
  @JsonKey(name:"id")
  String? id;

  @JsonKey(name:"message")
  String? message;

  @JsonKey(name:"pressingTime")
  int? pressingTime;

  @JsonKey(name:"name")
  String? name;

  User1Comment({
    this.id,
    this.message,
    this.pressingTime,
    this.name
  });

  factory User1Comment.fromJson(Map<String, dynamic> json) => _$User1CommentFromJson(json);

  Map<String, dynamic> toJson() => _$User1CommentToJson(this);

}