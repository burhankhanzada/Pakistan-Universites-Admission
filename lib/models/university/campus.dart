
import 'package:json_annotation/json_annotation.dart';

part 'campus.g.dart';

@JsonSerializable()
class Campus implements Comparable<Campus> {
  final String name, address, phone, website, email;

  Campus({this.name, this.address, this.phone, this.website, this.email});

  factory Campus.fromJson(Map<String, dynamic> json) => _$CampusFromJson(json);

  Map<String, dynamic> toJson() => _$CampusToJson(this);

  @override
  int compareTo(Campus other) {
    return name.compareTo(other.name);
  }
}
