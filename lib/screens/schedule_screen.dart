import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../models/weekly_schedule_models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'weekly_schedule.dart';

class MondayScreen extends StatefulWidget {
  static const routeName = '/monday-screen';

  const MondayScreen ({Key? key}) : super(key: key);

  @override
  _MondayScreen createState() => _MondayScreen();
}

class _MondayScreen extends State<MondayScreen>{

  static List<WeeklySchedule> extractedData = [];
  // late TextEditingController _controller;

  Future<List<WeeklySchedule>> getData() async {
    var client = http.Client();
    WeeklySchedule weeklyScheduleModel;
    const url = 'https://notedote.herokuapp.com/weekly_schedule/get-monday-schedule/';

    try {
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200){
        // print('success!');
        // print(response.body);
        var jsonString = response.body;
        var jsonRes = jsonDecode(jsonString);
        var jumlahData = jsonRes.length;
        // print(jumlahData);
        extractedData = [];
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
      return extractedData;
    }

    return extractedData;
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   setState(() {
  //     getData();
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   this.getData();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monday Schedule'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              // Navigator.pop(context);
              Navigator.popAndPushNamed(context, WeeklySchedules.routeName);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),

      body: FutureBuilder<List<WeeklySchedule>>(
        future: getData(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return ListView.builder(
              itemCount: extractedData.length,
              itemBuilder: (context, index){
                var schedule = extractedData[index];
                return Container(
                  height: 100,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        schedule.fields.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      // Text(
                      //   schedule.fields.day
                      // ),
                      Text(
                        schedule.fields.startTime
                      ),
                      Text(
                        schedule.fields.dueTime
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

              // body: new ListView.builder(
              //   itemCount: extractedData == null ? 0 : extractedData.length,
              //   itemBuilder: (BuildContext context, int index){
              //     return new Container(
              //       child: Column(
              //         children: <Widget>[
              //           Card(
              //               child: Text(extractedData[index].fields.name,
              //                 style: TextStyle(
              //                   fontSize: 20, fontWeight: FontWeight.bold
              //                 ),
              //               ),
              //           )
              //         ],
              //       ),
              //     );
              //
              //     // return new Card(
              //     //   child: new Text(extractedData[index].fields.name),
              //     // );
              //   },
              // ),

              // return Column(
              //   children: extractedData.map((i) {
              //     return ScheduleTable(
              //
              //     )
              //   }),
              // )



      // body: Center(
      //   child: ElevatedButton(
      //     child: const Text("Get Data Test"),
      //     onPressed: getData,
      //   ),
      // ),
    );
  }

}

class TuesdayScreen extends StatefulWidget {
  static const routeName = '/tuesday-screen';

  const TuesdayScreen ({Key? key}) : super(key: key);

  @override
  _TuesdayScreen createState() => _TuesdayScreen();
}

class _TuesdayScreen extends State<TuesdayScreen>{

  static List<WeeklySchedule> extractedData = [];

  Future<List<WeeklySchedule>> getData() async {
    var client = http.Client();
    WeeklySchedule weeklyScheduleModel;
    const url = 'https://notedote.herokuapp.com/weekly_schedule/get-tuesday-schedule/';

    try {
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200){
        // print('success!');
        // print(response.body);
        var jsonString = response.body;
        var jsonRes = jsonDecode(jsonString);
        var jumlahData = jsonRes.length;
        // print(jumlahData);
        extractedData = [];
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
      return extractedData;
    }

    return extractedData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tuesday Schedule'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: FutureBuilder<List<WeeklySchedule>>(
        future: getData(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return ListView.builder(
              itemCount: extractedData.length,
              itemBuilder: (context, index){
                var schedule = extractedData[index];
                return Container(
                  height: 100,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        schedule.fields.name,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      // Text(
                      //   schedule.fields.day
                      // ),
                      Text(
                          schedule.fields.startTime
                      ),
                      Text(
                          schedule.fields.dueTime
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

}

class WednesdayScreen extends StatefulWidget {
  static const routeName = '/wednesday-screen';

  const WednesdayScreen ({Key? key}) : super(key: key);

  @override
  _WednesdayScreen createState() => _WednesdayScreen();
}

class _WednesdayScreen extends State<WednesdayScreen>{

  static List<WeeklySchedule> extractedData = [];

  Future<List<WeeklySchedule>> getData() async {
    var client = http.Client();
    WeeklySchedule weeklyScheduleModel;
    const url = 'https://notedote.herokuapp.com/weekly_schedule/get-wednesday-schedule/';

    try {
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200){
        // print('success!');
        // print(response.body);
        var jsonString = response.body;
        var jsonRes = jsonDecode(jsonString);
        var jumlahData = jsonRes.length;
        // print(jumlahData);
        extractedData = [];
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
      return extractedData;
    }

    return extractedData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wednesday Schedule'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: FutureBuilder<List<WeeklySchedule>>(
        future: getData(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return ListView.builder(
              itemCount: extractedData.length,
              itemBuilder: (context, index){
                var schedule = extractedData[index];
                return Container(
                  height: 100,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        schedule.fields.name,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      // Text(
                      //   schedule.fields.day
                      // ),
                      Text(
                          schedule.fields.startTime
                      ),
                      Text(
                          schedule.fields.dueTime
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

}

class ThursdayScreen extends StatefulWidget {
  static const routeName = '/thursday-screen';

  const ThursdayScreen ({Key? key}) : super(key: key);

  @override
  _ThursdayScreen createState() => _ThursdayScreen();
}

class _ThursdayScreen extends State<ThursdayScreen>{

  static List<WeeklySchedule> extractedData = [];

  Future<List<WeeklySchedule>> getData() async {
    var client = http.Client();
    WeeklySchedule weeklyScheduleModel;
    const url = 'https://notedote.herokuapp.com/weekly_schedule/get-thursday-schedule/';

    try {
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200){
        // print('success!');
        // print(response.body);
        var jsonString = response.body;
        var jsonRes = jsonDecode(jsonString);
        var jumlahData = jsonRes.length;
        // print(jumlahData);
        extractedData = [];
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
      return extractedData;
    }

    return extractedData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thursday Schedule'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: FutureBuilder<List<WeeklySchedule>>(
        future: getData(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return ListView.builder(
              itemCount: extractedData.length,
              itemBuilder: (context, index){
                var schedule = extractedData[index];
                return Container(
                  height: 100,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        schedule.fields.name,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      // Text(
                      //   schedule.fields.day
                      // ),
                      Text(
                          schedule.fields.startTime
                      ),
                      Text(
                          schedule.fields.dueTime
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

}

class FridayScreen extends StatefulWidget {
  static const routeName = '/friday-screen';

  const FridayScreen ({Key? key}) : super(key: key);

  @override
  _FridayScreen createState() => _FridayScreen();
}

class _FridayScreen extends State<FridayScreen>{

  static List<WeeklySchedule> extractedData = [];

  Future<List<WeeklySchedule>> getData() async {
    var client = http.Client();
    WeeklySchedule weeklyScheduleModel;
    const url = 'https://notedote.herokuapp.com/weekly_schedule/get-friday-schedule/';

    try {
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200){
        // print('success!');
        // print(response.body);
        var jsonString = response.body;
        var jsonRes = jsonDecode(jsonString);
        var jumlahData = jsonRes.length;
        // print(jumlahData);
        extractedData = [];
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
      return extractedData;
    }

    return extractedData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friday Schedule'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: FutureBuilder<List<WeeklySchedule>>(
        future: getData(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return ListView.builder(
              itemCount: extractedData.length,
              itemBuilder: (context, index){
                var schedule = extractedData[index];
                return Container(
                  height: 100,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        schedule.fields.name,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      // Text(
                      //   schedule.fields.day
                      // ),
                      Text(
                          schedule.fields.startTime
                      ),
                      Text(
                          schedule.fields.dueTime
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

}

class SaturdayScreen extends StatefulWidget {
  static const routeName = '/saturday-screen';

  const SaturdayScreen ({Key? key}) : super(key: key);

  @override
  _SaturdayScreen createState() => _SaturdayScreen();
}

class _SaturdayScreen extends State<SaturdayScreen>{

  static List<WeeklySchedule> extractedData = [];

  Future<List<WeeklySchedule>> getData() async {
    var client = http.Client();
    WeeklySchedule weeklyScheduleModel;
    const url = 'https://notedote.herokuapp.com/weekly_schedule/get-saturday-schedule/';

    try {
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200){
        // print('success!');
        // print(response.body);
        var jsonString = response.body;
        var jsonRes = jsonDecode(jsonString);
        var jumlahData = jsonRes.length;
        // print(jumlahData);
        extractedData = [];
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
      return extractedData;
    }

    return extractedData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saturday Schedule'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: FutureBuilder<List<WeeklySchedule>>(
        future: getData(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return ListView.builder(
              itemCount: extractedData.length,
              itemBuilder: (context, index){
                var schedule = extractedData[index];
                return Container(
                  height: 100,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        schedule.fields.name,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      // Text(
                      //   schedule.fields.day
                      // ),
                      Text(
                          schedule.fields.startTime
                      ),
                      Text(
                          schedule.fields.dueTime
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

}

class SundayScreen extends StatefulWidget {
  static const routeName = '/sunday-screen';

  const SundayScreen ({Key? key}) : super(key: key);

  @override
  _SundayScreen createState() => _SundayScreen();
}

class _SundayScreen extends State<SundayScreen>{

  static List<WeeklySchedule> extractedData = [];

  Future<List<WeeklySchedule>> getData() async {
    var client = http.Client();
    WeeklySchedule weeklyScheduleModel;
    const url = 'https://notedote.herokuapp.com/weekly_schedule/get-sunday-schedule/';

    try {
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200){
        // print('success!');
        // print(response.body);
        var jsonString = response.body;
        var jsonRes = jsonDecode(jsonString);
        var jumlahData = jsonRes.length;
        // print(jumlahData);
        extractedData = [];
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
      return extractedData;
    }

    return extractedData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sunday Schedule'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: FutureBuilder<List<WeeklySchedule>>(
        future: getData(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return ListView.builder(
              itemCount: extractedData.length,
              itemBuilder: (context, index){
                var schedule = extractedData[index];
                return Container(
                  height: 100,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        schedule.fields.name,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      // Text(
                      //   schedule.fields.day
                      // ),
                      Text(
                          schedule.fields.startTime
                      ),
                      Text(
                          schedule.fields.dueTime
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

}