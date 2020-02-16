import 'package:json_annotation/json_annotation.dart';
import 'package:pakistan_universities_admission/models/university/campus.dart';

part 'university.g.dart';

@JsonSerializable()
class University implements Comparable<University> {
  String name, logo, sector, city, address, phone, website, email, color, otherDetails;

  @JsonKey(defaultValue: false)
  bool isVerified;

  @JsonKey(required: false)
  List<String> cities;

  @JsonKey(required: false)
  List<Campus> campuses;

  @JsonKey(required: false)
  List<String> degrees;

  University(
      {this.name,
      this.logo,
      this.sector,
      this.city,
      this.address,
      this.phone,
      this.website,
      this.email,
      this.color,
      this.otherDetails,
      this.isVerified,
      this.cities,
      this.campuses,
      this.degrees});

  factory University.fromJson(Map<String, dynamic> json) => _$UniversityFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityToJson(this);

  @override
  int compareTo(University other) {
    return name.compareTo(other.name);
  }
}
