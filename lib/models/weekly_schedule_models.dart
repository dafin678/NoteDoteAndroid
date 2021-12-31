// To parse this JSON data, do
//
//     final weeklySchedule = weeklyScheduleFromJson(jsonString);

import 'dart:convert';

List<WeeklySchedule> weeklyScheduleFromJson(String str) => List<WeeklySchedule>.from(json.decode(str).map((x) => WeeklySchedule.fromJson(x)));

String weeklyScheduleToJson(List<WeeklySchedule> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WeeklySchedule {
  WeeklySchedule({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory WeeklySchedule.fromJson(Map<String, dynamic> json) => WeeklySchedule(
    model: json["model"],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    // required this.user,
    required this.name,
    required this.day,
    required this.startTime,
    required this.dueTime,
  });

  // int user;
  String name;
  int day;
  String startTime;
  String dueTime;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    // user: json["user"],
    name: json["name"],
    day: json["day"],
    startTime: json["start_time"],
    dueTime: json["due_time"],
  );

  Map<String, dynamic> toJson() => {
    // "user": user,
    "name": name,
    "day": day,
    "start_time": startTime,
    "due_time": dueTime,
  };
}
