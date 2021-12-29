import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class ScheduleForm extends StatefulWidget {
  static const routeName = '/add-schedule';

  const ScheduleForm ({Key? key}) : super(key: key);

  @override   
  _ScheduleForm createState() => _ScheduleForm();
}

class _ScheduleForm extends State<ScheduleForm> {

  final _formkey = GlobalKey<FormState>();
  // static const Color dark = Color(0xffffff);

  var title = '';
  var day = '';
  var startTime = '';
  var dueTime = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weekly Schedule Form'),
        backgroundColor: Colors.grey[500],
        foregroundColor: Colors.deepPurple[900],
      ),
      drawer: const MainDrawer(), // optional
      body: Container(
        color: Colors.white24,
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child:Text('Add Schedule in here', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.teal[200])),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Name: '),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: "Enter a schedule title",
                      labelText: "Name of schedule",
                      icon: const Icon(Icons.assignment),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please add a valid text for name';
                    }
                    title = value;
                    return null;
                  },
                ),
              ),
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Day: ')
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter a day of schedule",
                        labelText: "Day of schedule",
                        icon: const Icon(Icons.calendar_today),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please add a valid day';
                      }
                      day = value;
                      return null;
                    },
                  )
              ),
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Start Time: ')
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:TextFormField(
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                        hintText: "Enter a start time of schedule",
                        labelText: "Start Time of schedule",
                        icon: const Icon(Icons.watch_later),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please add a valid time';
                      }
                      startTime = value;
                      return null;
                    },
                  )
              ),
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Due Time: ')
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:TextFormField(
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                        hintText: "Enter a end time of schedule",
                        labelText: "End Time of schedule",
                        icon: const Icon(Icons.watch_later_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please add a valid time';
                      }
                      dueTime = value;
                      return null;
                    },
                  )
              ),
              Padding(
                // padding: const EdgeInsets.symmetric(vertical: 16.0),
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      // print('schedule with title: ${title}, day: ${day}, start time: ${startTime}, and due time: ${dueTime} successfully added');
                      // if the form is valid, display a snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Add Schedule Success')),
                      );
                  }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal[200],
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: const TextStyle(
                    fontSize: 20,
                    // fontWeight: FontWeight.bold
                    )
                  ),
                  child: const Text('Submit', style: TextStyle(color: Colors.deepPurple),),
                ),
              ),
            ],
          ),
        ),
      )

    );
  }

}



class WeeklySchedule extends StatefulWidget {
  static const routeName = '/weekly-schedule';

  const WeeklySchedule({Key? key}) : super(key: key);

  @override
  _WeeklyScheduleState createState() => _WeeklyScheduleState();
}

class _WeeklyScheduleState extends State<WeeklySchedule> {

  late List data;

  Future<String> getData() async {
    var response = await http.get(
        // Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        headers: {
          "Accept": "application/json"
        }
    );
    // print(response.body);

    data = json.decode(response.body);
    // print(data[1]["title"]);

    return "Success!";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weekly Schedule'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(ScheduleForm.routeName);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Center(
        child: ElevatedButton(
          child: const Text("Get Data Test"),
          onPressed: getData,
        ),
      ),
    );
  }

}