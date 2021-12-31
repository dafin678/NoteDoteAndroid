import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../models/weekly_schedule_models.dart';
import 'schedule_screen.dart';

class ScheduleForm extends StatefulWidget {
  static const routeName = '/add-schedule';

  const ScheduleForm ({Key? key}) : super(key: key);

  @override   
  _ScheduleForm createState() => _ScheduleForm();
}

class _ScheduleForm extends State<ScheduleForm> {

  final _formkey = GlobalKey<FormState>();
  // static const Color dark = Color(0xffffff);

  List<String> dayItems = [
    'monday',
    'tuesday',
    'wednesday',
    'friday',
    'saturday',
    'sunday',
  ];

  final daySelected = TextEditingController();

  var title = '';
  var day = '';
  var startTime = '';
  var dueTime = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weekly Schedule Form', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.grey[500],
        foregroundColor: Colors.deepPurple[900],
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.assignment),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      drawer: const MainDrawer(), // optional
      body: Center(
        // color: Colors.white24,
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child:Text('Add Schedule in here', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.teal[200]),
                  textAlign: TextAlign.center,),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Name: '),
              ),
              Padding(
              // SizedBox(
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
                        hintText: "Enter a valid integer for day, 1:monday, 2:tuesday, ... , 7:sunday",
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
                        hintText: "Enter a start time of schedule (Format: HH:MM:SS)",
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
                        hintText: "Enter a end time of schedule (Format: HH:MM:SS)",
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
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      // print('schedule with title: ${title}, day: ${day}, start time: ${startTime}, and due time: ${dueTime} successfully added');
                      // if the form is valid, display a snackbar
                      final response = await http.post(
                        Uri.parse("https://notedote.herokuapp.com/weekly_schedule/post-data/"),
                        headers: <String, String>{
                          'Content-Type':'application/json; charset=UTF-8',
                        },
                        body: jsonEncode(<String, String>{
                          'name': title,
                          'day': day,
                          'start_time': startTime,
                          'due_time': dueTime,
                        })
                      );
                      // print(response);
                      // print(response.body);
                      // print(title);
                      // print(day);
                      // print(startTime);
                      // print(dueTime);


                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Add Schedule Success')),
                      );
                      Navigator.popAndPushNamed(context, WeeklySchedules.routeName);
                    } else {
                      // print('Tidak valid');
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



class WeeklySchedules extends StatefulWidget {
  static const routeName = '/weekly-schedule';

  const WeeklySchedules({Key? key}) : super(key: key);

  @override
  _WeeklyScheduleState createState() => _WeeklyScheduleState();

}

class _WeeklyScheduleState extends State<WeeklySchedules> {

  // late List data;
  // late Future<WeeklySchedule> _weeklyScheduleModel;
  static List<WeeklySchedule> extractedData = [];
  // late TextEditingController _controller;
  //
  // static fetchData() async {
  //   const url = 'https://notedote.herokuapp.com/weekly_schedule/get_all_schedule/';
  //   // const url = 'https://notedote.herokuapp.com/tasks/get_all_tasks';
  //
  //   try {
  //     extractedData = [];
  //     final response = await http.get(Uri.parse(url));
  //     // print(response);
  //     print(response.body);
  //
  //
  //     final dataJson = jsonDecode(response.body);
  //     for (var i in dataJson){
  //       if (i["fields"]["name"] != "NULL" && i["fields"]["day"] != "NULL" && i["fields"]["startTime"] != "NULL" && i["fields"]["dueTime"] != "NULL") {
  //       print('masuk sini');
  //       if (i["fields"]["name"] == null) print('name null');
  //       if (i["fields"]["day"] == null) print('day null');
  //       if (i["fields"]["startTime"] == null) print('startTime null');
  //       if (i["fields"]["dueTime"] == null) print('dueTime null');
  //         Fields fields = Fields(
  //             // user: i["fields"]["user"],
  //             name: i["fields"]["name"],
  //             day: i["fields"]["day"],
  //             startTime: i["fields"]["startTime"],
  //             dueTime: i["fields"]["dueTime"]);
  //         print('fields terbuat');
  //         WeeklySchedule schedule =
  //             WeeklySchedule(model: i["model"], pk: i["pk"], fields: fields);
  //         extractedData.add(schedule);
  //         print('terbuat ');
  //       }
  //     }
  //
  //     return extractedData;
  //   } catch (error){
  //     print('ada error');
  //     print(error);
  //   }
  // }
  //
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   setState(() {
  //     fetchData();
  //   });
  // }
  //
  // @override
  // void initState(){
  //   // _weeklyScheduleModel = getData();
  //   super.initState();
  //   _controller = TextEditingController();
  // }

  // Future<String> getData() async {
  //   var response = await http.get(
  //       // Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
  //       // Uri.parse("https://jsonplaceholder.typicode.com/posts"),
  //       Uri.parse(jsonDecode('https://notedote.herokuapp.com/weekly_schedule/get_all_schedule/')), // ubah pakai json schedule list dari django
  //       headers: {
  //         "Accept": "application/json"
  //       }
  //   );
  //   print(response.body);
  //
  //   data = json.decode(response.body);
  //   // print(data);
  //   // print(data[1]["title"]);
  //
  //   // var response = await http.get(Uri.parse('https://notedote.herokuapp.com/weekly_schedule/get_all_schedule/'));
  //   //
  //   // final items = json.decode(response.body).cast<Map<String,dynamic>>();
  //   // List<String> list_schedule = items.map<String>((json){
  //   //   // return String.fromJson(json);
  //   // }).toList();
  //
  //   return "Success!";
  // }

  // Future<WeeklySchedule> getData() async {
  //   var client = http.Client();
  //   var weeklyScheduleModel;
  //   const url = 'https://notedote.herokuapp.com/weekly_schedule/get_all_schedule/';
  //
  //   try {
  //     print('coba');
  //     var response = await client.get(Uri.parse(url));
  //     if (response.statusCode == 200){
  //       print('success!');
  //       print(response.body);
  //       var jsonString = response.body;
  //       var jsonMap = json.decode(jsonString);
  //
  //       weeklyScheduleModel = WeeklySchedule.fromJson(jsonMap);
  //     }
  //   } catch (Exception){
  //     print('di sini');
  //     return weeklyScheduleModel;
  //   }
  //
  //   print('di sini');
  //   return weeklyScheduleModel;
  // }

  Future<void> getData() async {
    var client = http.Client();
    WeeklySchedule weeklyScheduleModel;
    const url = 'https://notedote.herokuapp.com/weekly_schedule/get_all_schedule/';

    try {
      // print('coba');
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200){
        // print('success!');
        // print(response.body);
        var jsonString = response.body;
        var jsonRes = jsonDecode(jsonString);
        var jumlahData = jsonRes.length;
        // print(jumlahData);
        for (var i = 0; i < jumlahData; ++i){
          var jsonMap = json.decode(jsonString)[i];
          // print('isi json index ke - ${i}');
          // print(jsonMap);
          weeklyScheduleModel = WeeklySchedule.fromJson(jsonMap);
          extractedData.add(weeklyScheduleModel);
        }


      }
    } catch (exception){
      // print(exception);
      // return extractedData;
    }

    // return extractedData;
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
      body: GridView(
        padding: const EdgeInsets.all((25)),
        children: dayCategories
            .map(
              (catData) => DayItem(
            catData.name,
            catData.color,
          ),
        )
            .toList(),

        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),

      // body: Center(
      //   child: ElevatedButton(
      //     child: const Text("Get Data Test"),
      //     onPressed: getData,
      //   ),
      // ),

      // body: Container(
      //   child: FutureBuilder<WeeklySchedule>(
      //     future: _weeklyScheduleModel,
      //     builder: (context, snapshot){
      //       if (snapshot.hasData){
      //         return ListView.builder(
      //           // itemCount: snapshot.data,
      //           itemBuilder: (context, index){
      //             var
      //           },
      //         )
      //       }
      //     },
      //   ),
      // ),

    );
  }

}

class Day {
  final String name;
  final Color color;

  const Day({
    required this.name,
    required this.color,
  });
}

const dayCategories = [
  Day(name: 'Monday', color: Colors.purple),
  Day(name: 'Tuesday', color: Colors.red),
  Day(name: 'Wednesday', color: Colors.orange),
  Day(name: 'Thursday', color: Colors.amber),
  Day(name: 'Friday', color: Colors.blue),
  Day(name: 'Saturday', color: Colors.green),
  Day(name: 'Sunday', color: Colors.lightBlue),
];

class DayItem extends StatelessWidget {
  final String name;
  final Color color;

  const DayItem(this.name, this.color, {Key? key}) : super(key: key);

  void selectCategory(BuildContext ctx, String nameDay) {
    switch (nameDay){
      case "Monday":
        Navigator.of(ctx).pushNamed(MondayScreen.routeName);
        break;

      case "Tuesday":
        Navigator.of(ctx).pushNamed(TuesdayScreen.routeName);
        break;

      case "Wednesday":
        Navigator.of(ctx).pushNamed(WednesdayScreen.routeName);
        break;

      case "Thursday":
        Navigator.of(ctx).pushNamed(ThursdayScreen.routeName);
        break;

      case "Friday":
        Navigator.of(ctx).pushNamed(FridayScreen.routeName);
        break;

      case "Saturday":
        Navigator.of(ctx).pushNamed(SaturdayScreen.routeName);
        break;

      case "Sunday":
        Navigator.of(ctx).pushNamed(SundayScreen.routeName);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context, name),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          name,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

}