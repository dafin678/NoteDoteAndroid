// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, use_key_in_widget_constructors, non_constant_identifier_names, unused_field, avoid_print, unused_element
import 'package:flutter/material.dart';
import 'package:projek_akhir_f07/widgets/main_drawer.dart';
import '../models/comment_task.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:provider/provider.dart';
import '../cookie_request.dart';
import '../widgets/task_table.dart';


class AddTask extends StatefulWidget {
  final String title;
  static const routeName = '/add-task';
  const AddTask({
    required this.title,
  });
    @override
  AddTaskState createState() => AddTaskState();
}

class AddTaskState extends State<AddTask> {
  int AddTaskStateIndex = 0;
  static List<IsiTasks> extractedData = [];
  late TextEditingController _controller;

  static final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  static String nama = "";
  static String description = "";
  static String due_date = "";
  static String end_time = "";

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.url,
            maxLength: 30,
            controller: _nameController,
            decoration: InputDecoration(
                hintText: "Enter a Name",
                contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Insert a Name';
              }
            },
          ),
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.url,
            maxLength: 30,
            controller: _descController,
            decoration: InputDecoration(
                hintText: "Enter a Description",
                contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Insert a Description';
              }
            },
          ),
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.url,
            maxLength: 30,
            controller: _dateController,
            decoration: InputDecoration(
                hintText: "Enter the Due Date MM-DD-YYYY",
                contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Insert the Due Date';
              }
            },
          ),
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.url,
            maxLength: 30,
            controller: _timeController,
            decoration: InputDecoration(
                hintText: "Enter the End Time HH-MM",
                contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Insert the End time';
              }
            },
          ),
          SizedBox(
            height: 12,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 16),
              primary: Colors.orange.shade800,
              onPrimary: Colors.white,
              side: BorderSide(width: 2, color: Colors.transparent),
              padding: EdgeInsets.only(
                  left: 12, right: 12, top: 8, bottom: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
            ),
            onPressed: () async{
              var map = <String, String>{};
              map ["name"] = _nameController.text;
              map ["desscription"] = _descController.text;
              map ["date_time"] = _dateController.text; 
              map ["end_time"] = _timeController.text;
              await request.post("https://notedote.herokuapp.com/tasks/add-task",map);
                  Navigator.pop(context);
                  // print(map);
                },
              child: const Text('Add')),
        ],
      )
      ),
    );
  }
}