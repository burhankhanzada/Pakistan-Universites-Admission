// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Campus _$CampusFromJson(Map<String, dynamic> json) {
  return Campus(
    name: json['name'] as String,
    address: json['address'] as String,
    phone: json['phone'] as String,
    website: json['website'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$CampusToJson(Campus instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'website': instance.website,
      'email': instance.email,
    };
