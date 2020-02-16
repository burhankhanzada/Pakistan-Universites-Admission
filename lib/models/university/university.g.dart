// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

University _$UniversityFromJson(Map<String, dynamic> json) {
  return University(
    name: json['name'] as String,
    logo: json['logo'] as String,
    sector: json['sector'] as String,
    city: json['city'] as String,
    address: json['address'] as String,
    phone: json['phone'] as String,
    website: json['website'] as String,
    email: json['email'] as String,
    color: json['color'] as String,
    otherDetails: json['otherDetails'] as String,
    isVerified: json['isVerified'] as bool ?? false,
    cities: (json['cities'] as List)?.map((e) => e as String)?.toList(),
    campuses: (json['campuses'] as List)
        ?.map((e) =>
            e == null ? null : Campus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    degrees: (json['degrees'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$UniversityToJson(University instance) =>
    <String, dynamic>{
      'name': instance.name,
      'logo': instance.logo,
      'sector': instance.sector,
      'city': instance.city,
      'address': instance.address,
      'phone': instance.phone,
      'website': instance.website,
      'email': instance.email,
      'color': instance.color,
      'otherDetails': instance.otherDetails,
      'isVerified': instance.isVerified,
      'cities': instance.cities,
      'campuses': instance.campuses,
      'degrees': instance.degrees,
    };
