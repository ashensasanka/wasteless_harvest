import 'package:json_annotation/json_annotation.dart';
part 'crops.g.dart';

@JsonSerializable()
class Crops {
  @JsonKey(name:"id")
  String? id;

  @JsonKey(name:"name")
  String? name;

  @JsonKey(name:"type")
  String? type;

  @JsonKey(name:"image")
  String? image;

  @JsonKey(name:"plant_date")
  String? plant_date;

  @JsonKey(name:"harvest_date")
  String? harvest_date;

  Crops({
    this.id,
    this.name,
    this.type,
    this.image,
    this.plant_date,
    this.harvest_date,
  });

  factory Crops.fromJson(Map<String, dynamic> json) => _$CropsFromJson(json);

  Map<String, dynamic> toJson() => _$CropsToJson(this);

}