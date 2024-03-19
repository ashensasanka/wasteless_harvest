// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddListing _$AddListingFromJson(Map<String, dynamic> json) => AddListing(
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      image: json['image'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      stating_price: (json['stating_price'] as num?)?.toDouble(),
      hbidname: json['hbidname'] as String?,
      date: json['date'] as String?,
      hbid: (json['hbid'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AddListingToJson(AddListing instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'image': instance.image,
      'amount': instance.amount,
      'stating_price': instance.stating_price,
      'hbidname': instance.hbidname,
      'date': instance.date,
      'hbid': instance.hbid,
    };
