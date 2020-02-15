import 'package:pakistan_universities_admission/models/university/campus.dart';

class University implements Comparable<University> {
  final String name, sector, address, phone, website, email, otherDetails;
  final bool isVerified;
  final dynamic city;
  final List<Campus> campusList;
  final List<String> degreeList;

  University(
      {this.name,
      this.sector,
      this.city,
      this.address,
      this.phone,
      this.website,
      this.email,
      this.otherDetails,
      this.isVerified,
      this.campusList,
      this.degreeList});

  factory University.fromJson(Map<String, dynamic> json) {
    var degreesFromJSon = json['degrees'];
    List<String> degreeList;

    if (degreesFromJSon != null) {
      degreeList = List.from(degreesFromJSon);
    }

    // var cityFromJson = json['city'];
    // List<String> cityList;

    // if (cityFromJson is List) {
    //   cityList = List.from(cityFromJson);
    // } else {
    //   cityList = json['city'];
    // }

    return new University(
        name: json['name'],
        sector: json['sector'],
        address: json['address'],
        city: json['city'],
        website: json['website'],
        email: json['email'],
        phone: json['phone'],
        otherDetails: json['other_details'],
        degreeList: degreeList);
  }

  @override
  int compareTo(University other) {
    return name.compareTo(other.name);
  }
}
