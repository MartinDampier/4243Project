import 'package:flutter_application_1/enums/genders.dart';
import 'package:flutter_application_1/models/class.dart';

class user
{
  final Classes = <StudentClass>[];
  String? UserName;
  String? Email;
  String? PhoneNumber;
  DateTime? BirthDate;
  String? MainSubject;
  genders? Gender;

  Map toJson() => {
    'UserName' : UserName,
    'Email' : Email,
    'PhoneNumber' : PhoneNumber,
    'BirthDate' : BirthDate!.toIso8601String(),
    'MainSubject' : MainSubject,
    'Gender' : Gender.toString()
  };
}