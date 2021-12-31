import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../models/weekly_schedule_models.dart';

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

                  // child: SizedBox(
                  //   height: 20.0,
                  //   child: DropDownField(
                  //     controller: daySelected,
                  //     hintText: "Select day of schedule",
                  //     enabled: true,
                  //     items: dayItems,
                  //     onValueChanged: (value){
                  //       setState(() {
                  //         day = value;
                  //       });
                  //     },
                  //   ),
                  // )


                  // child: DropdownButtonFormField2(
                  //   decoration: InputDecoration(
                  //     isDense: true,
                  //     contentPadding: EdgeInsets.zero,
                  //     border: OutlineInputBorder(
                  //       // borderRadius: BorderRadius.circular(5.0),
                  //       borderRadius: BorderRadius.circular(15),
                  //     ),
                  //   ),
                  //   isExpanded: true,
                  //   hint: const Text(
                  //     'Select day of the schedule',
                  //     style: TextStyle(fontSize: 14),
                  //   ),
                  //   iconSize: 30,
                  //   buttonHeight: 60,
                  //   buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  //   dropdownDecoration: BoxDecoration(
                  //     // borderRadius: BorderRadius.circular(5.0),
                  //     borderRadius: BorderRadius.circular(15),
                  //   ),
                  //   items: dayItems.map((item) => DropdownMenuItem<String>(
                  //       child: Text(
                  //         item,
                  //         style: const TextStyle(
                  //           fontSize: 14,
                  //         ),
                  //       ),
                  //   )).toList(),
                  //   validator: (value){
                  //     if (value == null){
                  //       return 'Please select a valid day.';
                  //     }
                  //   },
                  //   onChanged: (value){
                  //     // do something
                  //   },
                  //   onSaved: (value){
                  //     day = value.toString();
                  //   },
                  // ),


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



class WeeklySchedules extends StatefulWidget {
  static const routeName = '/weekly-schedule';

  const WeeklySchedules({Key? key}) : super(key: key);

  @override
  _WeeklyScheduleState createState() => _WeeklyScheduleState();

}

class _WeeklyScheduleState extends State<WeeklySchedules> {

  late List data;
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
      body: Center(
        child: ElevatedButton(
          child: const Text("Get Data Test"),
          onPressed: getData,
        ),
      ),

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