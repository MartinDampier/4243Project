import 'package:flutter/material.dart';

class StudentClass{
  String? name;
  String? classNumber;
  TimeOfDay? startTime;
  double? comparableStartTime;
  TimeOfDay? endTime;
  double? comparableEndTime;
  StudentClass(String name, String classNumber, TimeOfDay startTime, TimeOfDay endTime){
    this.name = name;
    this.startTime = startTime;
    this.endTime = endTime;
    this.classNumber = classNumber;
    comparableStartTime = startTime.hour + startTime.minute/60.0;
    comparableStartTime = startTime.hour + startTime.minute/60.0;
  }

  Map toJson() {
    var startDateTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      startTime!.hour,
      startTime!.minute
    );
    var endDateTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        endTime!.hour,
        endTime!.minute
    );
    return {
      'name': name,
      'classNumber': classNumber,
      'startTime': startDateTime.toIso8601String(),
      'comparableStartTime': comparableStartTime,
      'endTime': endDateTime.toIso8601String(),
      'comparableEndTime': comparableEndTime
    };
  }

}