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
}