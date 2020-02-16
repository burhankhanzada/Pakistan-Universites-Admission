import 'package:pakistan_universities_admission/models/degree/bachelor_degree.dart';
import 'package:pakistan_universities_admission/models/degree/degree.dart';
import 'package:pakistan_universities_admission/models/degree/master_degree.dart';

class BachelorDegrees {
  static final bscs = BachelorDegree(
      name: 'Bachelor of Science in Computer Sceince',
      key: 'bscs',
      requiredPercenatge: 50);

  static final bsse = BachelorDegree(
      name: 'Bachelor of Science in Software Engineering',
      key: 'bsse',
      requiredPercenatge: 50);

  static final bsit = BachelorDegree(
      name: 'Bachelor of Science in Information Technology',
      key: 'bsit',
      requiredPercenatge: 50);

  static final bsai = BachelorDegree(
      name: 'Bachelor of Science in Artificial Intelligence',
      key: 'bsai',
      requiredPercenatge: 50);

  static final bsce = BachelorDegree(
      name: 'Bachelor of Engineering in Civil Engineering',
      key: 'bsce',
      requiredPercenatge: 60);

  static final bee = BachelorDegree(
      name: 'Bachelor of Engineering in Electrical Engineering',
      key: 'bee',
      requiredPercenatge: 60);

  static final bsee = BachelorDegree(
      name: 'Bachelor of Engineering in Electronics Engineering',
      key: 'bsee',
      requiredPercenatge: 60);

  static final bba = BachelorDegree(
      name: 'Bachelor of Bussiness Administration',
      key: 'bba',
      requiredPercenatge: 45);

  static final bms = BachelorDegree(
      name: 'Bachelor of Media Science', key: 'bms', requiredPercenatge: 45);

  static final mbbs = BachelorDegree(
      name: 'Bachelor of Medicine/Bachelor of Surgery', key: 'mbbs');

  static final bscn =
      BachelorDegree(name: 'Bachelor of Science in Nursing', key: 'bscn');

  static final pharmd =
      BachelorDegree(name: 'Doctor of Pharmacy', key: 'pharmd')
        ..years = "5 Years";

  static final List<Degree> bachelorsDegreesList = [
    bscs,
    bsse,
    bsit,
    bsai,
    bsce,
    bsce,
    bee,
    bsee,
    bba,
    bms,
    mbbs,
    bscn,
    pharmd
  ];
}

class MasterDegrees {
  static final mee = MasterDegree(
      name: 'Master of Electrical Engineering', key: 'mee', reuiredCGPA: 2.5);

  static final mba = MasterDegree(
      name: 'Master of Bussiness Administration',
      key: 'bsee',
      reuiredCGPA: 2.5);

  static final List<Degree> bachelorsDegreesList = [mee, mba];
}
