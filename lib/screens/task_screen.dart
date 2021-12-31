// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, use_key_in_widget_constructors, non_constant_identifier_names, unused_field, avoid_print, unused_element
import 'package:flutter/material.dart';
import 'package:projek_akhir_f07/widgets/main_drawer.dart';
import '../models/comment_task.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/task_table.dart';


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
        print(response.body);
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      fetchData();
    });
  }

  //Buat jalanin semua function
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }
  static final _formKey = GlobalKey<FormState>();
  static String nama = "";
  static String description = "";
  static String due_date = "";

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    FutureBuilder(
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
    Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.url,
            maxLength: 30,
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
              nama = value;
              return null;
            },
          ),
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.url,
            maxLength: 30,
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
              description = value;
              return null;
            },
          ),
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.url,
            maxLength: 30,
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
              due_date = value;
              return null;
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
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print(nama + " with deadline " + due_date + " successfully added");
              }
            },
            child: const Text('Add'),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      TaskStateIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView(children: <Widget>[ 
        _widgetOptions.elementAt(TaskStateIndex), 
          ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            label: 'Add Task',
          ),
        ],
        currentIndex: TaskStateIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
            setState(() {
              TaskStateIndex = index;
            });
          },
      ),
      drawer: MainDrawer(),
    );
  }

  Widget form() {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView(children: <Widget>[
        TextFormField(
          autofocus: true,
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
            return null;
          },
        ),
      ]
      )
    );
  }
}