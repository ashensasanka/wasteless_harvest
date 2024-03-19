import 'package:json_annotation/json_annotation.dart';
part 'rate_comment.g.dart';

@JsonSerializable()
class RateComment {
  @JsonKey(name:"id")
  String? id;

  @JsonKey(name:"name")
  String? name;

  @JsonKey(name:"image")
  String? image;

  @JsonKey(name:"rate")
  double? rate;

  RateComment({
    this.id,
    this.name,
    this.image,
    this.rate,
  });

  factory RateComment.fromJson(Map<String, dynamic> json) => _$RateCommentFromJson(json);

  Map<String, dynamic> toJson() => _$RateCommentToJson(this);

}