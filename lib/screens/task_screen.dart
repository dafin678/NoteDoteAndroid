// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, use_key_in_widget_constructors, non_constant_identifier_names, unused_field, avoid_print, unused_element
import 'package:flutter/material.dart';
import 'package:projek_akhir_f07/widgets/main_drawer.dart';
import '../models/comment_task.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import '../cookie_request.dart';
import '../widgets/task_table.dart';
import 'add_task_screen.dart';


class Task extends StatefulWidget {
  final String title;
  static const routeName = '/tasks';
  const Task({
    required this.title,
  });
    @override
  TaskState createState() => TaskState();
}

class TaskState extends State<Task> {
  int TaskStateIndex = 0;
  static List<IsiTasks> extractedData = [];
  late TextEditingController _controller;
  static fetchData() async {
      const url = 'https://notedote.herokuapp.com/tasks/get_all_tasks';
      try {
        extractedData = [];
        final response = await http.get(Uri.parse(url));
        // print(response.body);
        final dataJson = jsonDecode(response.body);
        for (var i in dataJson) {
          Fields fields = Fields(
            taskName: i["fields"]["name"],
            taskDescription: i["fields"]["description"],
            taskDate: i["fields"]["task_date"],
            taskTime: i["fields"]["end_time"]);
          IsiTasks tasks =
            IsiTasks(model: i["model"], pk: i["pk"], fields: fields);
          extractedData.add(tasks);
        }
        return extractedData;
      } catch (error) {
        print(error);
      }
    }


  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).pushNamed(AddTask.routeName);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Center(
                child: Text(
              "Loading...",
            ));
          } else {
            return Column(
                children: extractedData.map((i) {
              return TaskTable(
                taskName: i.fields.taskName,
                taskDescription: i.fields.taskDescription,
                taskDate: i.fields.taskDate,
                taskTime: i.fields.taskTime,
                taskPk: i.pk,
              );
            }).toList());
          }
        }),
      drawer: MainDrawer(),
    );
  }
}