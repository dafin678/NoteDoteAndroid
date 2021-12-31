// To parse this JSON data, do
//
//     final IsiTasks = IsiTasksFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

List<IsiTasks> IsiTasksFromJson(String str) =>
    List<IsiTasks>.from(json.decode(str).map((x) => IsiTasks.fromJson(x)));

String IsiTasksToJson(List<IsiTasks> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IsiTasks {
  IsiTasks({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory IsiTasks.fromJson(Map<String, dynamic> json) => IsiTasks(
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
    required this.taskName,
    required this.taskDescription,
    required this.taskDate,
    required this.taskTime,
  });

  String taskName;
  String taskDescription;
  String taskDate;
  String taskTime;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        taskName: json["name"],
        taskDescription: json["description"],
        taskDate: json["task_date"],
        taskTime: json["end_time"],
      );

  Map<String, dynamic> toJson() => {
        "name": taskName,
        "description": taskDescription,
        "task_date": taskDate,
        "end_time": taskTime,
      };
}