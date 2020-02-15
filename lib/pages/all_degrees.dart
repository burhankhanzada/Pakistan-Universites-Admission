import 'package:pakistan_universities_admission/models/degree/bachelor_degree.dart';
import 'package:pakistan_universities_admission/models/degree/master_degree.dart';

class BachelorDegrees {
  static final bscs = BachelorDegree(
      name: 'Bachelors Computer Sceince', key: 'bscs', requiredPercenatge: 50);

  static final bsse = BachelorDegree(
      name: 'Bachelors Software Engineering',
      key: 'bsse',
      requiredPercenatge: 50);

  static final bsit = BachelorDegree(
      name: 'Bachelors Information Technology',
      key: 'bsit',
      requiredPercenatge: 50);

  static final bsai = BachelorDegree(
      name: 'Bachelors Artificial Intelligence',
      key: 'bsai',
      requiredPercenatge: 50);

  static final bsce = BachelorDegree(
      name: 'Bachelors Civil Engineering', key: 'bsce', requiredPercenatge: 60);

  static final bee = BachelorDegree(
      name: 'Bachelors Electrical Engineering',
      key: 'bee',
      requiredPercenatge: 60);

  static final bsee = BachelorDegree(
      name: 'Bachelors Electronics Engineering',
      key: 'bsee',
      requiredPercenatge: 60);

  static final bba = BachelorDegree(
      name: 'Bachelors Bussiness Administration',
      key: 'bba',
      requiredPercenatge: 45);

  static final bms = BachelorDegree(
      name: 'Bachelors Media Science', key: 'bms', requiredPercenatge: 45);

  static final mbbs = BachelorDegree(
      name: 'Bachelors Medicine, Bachelors Surgery', key: 'mbbs');

  static final bscn =
      BachelorDegree(name: 'Bachelor of Science in Nursing', key: 'bscn');

  static var pharmD = BachelorDegree(name: 'Doctor of Pharmacy', key: 'pharmD')
    ..years = "5 Years";
}

class MasterDegrees {
  static final mee = MasterDegree(
      name: 'Masters Electrical Engineering', key: 'mee', reuiredCGPA: 2.5);

  static final mba = MasterDegree(
      name: 'Masters Bussiness Administration', key: 'bsee', reuiredCGPA: 2.5);
}
