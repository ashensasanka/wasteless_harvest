import 'package:json_annotation/json_annotation.dart';
part 'add_listing.g.dart';

@JsonSerializable()
class AddListing {
  @JsonKey(name:"id")
  String? id;

  @JsonKey(name:"name")
  String? name;

  @JsonKey(name:"type")
  String? type;

  @JsonKey(name:"image")
  String? image;

  @JsonKey(name:"amount")
  double? amount;

  @JsonKey(name:"stating_price")
  double? stating_price;

  @JsonKey(name:"hbidname")
  String? hbidname;

  @JsonKey(name:"date")
  String? date;

  @JsonKey(name:"hbid")
  double? hbid;

  AddListing({
    this.id,
    this.name,
    this.type,
    this.image,
    this.amount,
    this.stating_price,
    this.hbidname,
    this.date,
    this.hbid,
  });

  factory AddListing.fromJson(Map<String, dynamic> json) => _$AddListingFromJson(json);

  Map<String, dynamic> toJson() => _$AddListingToJson(this);

}