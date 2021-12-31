import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../models/weekly_schedule_models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MondayScreen extends StatefulWidget {
  static const routeName = '/monday-screen';

  const MondayScreen ({Key? key}) : super(key: key);

  @override
  _MondayScreen createState() => _MondayScreen();
}

class _MondayScreen extends State<MondayScreen>{

  static List<WeeklySchedule> extractedData = [];

  Future<void> getData() async {
    var client = http.Client();
    WeeklySchedule weeklyScheduleModel;
    const url = 'https://notedote.herokuapp.com/weekly_schedule/get-monday-schedule/';

    try {
      // print('coba');
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200){
        // print('success!');
        // print(response.body);
        var jsonString = response.body;
        var jsonRes = jsonDecode(jsonString);
        var jumlahData = jsonRes.length;
        print(jumlahData);
        for (var i = 0; i < jumlahData; ++i){
          var jsonMap = json.decode(jsonString)[i];
          print('isi json index ke - ${i}');
          print(jsonMap);
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

  // String strDay(int intDay){
  //   String res = '';
  //
  //   switch (intDay){
  //     case 1:
  //       res = "monday";
  //       break;
  //     case 2:
  //       res = "tuesday";
  //       break;
  //     case 3:
  //       res = "wednesday";
  //       break;
  //     case 4:
  //       res = "thursday";
  //       break;
  //     case 5:
  //       res = "friday";
  //       break;
  //     case 6:
  //       res = "saturday";
  //       break;
  //     case 7:
  //       res = "sunday";
  //       break;
  //
  //     return res;
  //   }
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
              Navigator.pop(context);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Container(
        child: FutureBuilder(
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
                    child: Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            schedule.fields.name,
                            style: TextStyle(
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
                    )
                  );
                },
              );

              // return Column(
              //   children: extractedData.map((i) {
              //     return ScheduleTable(
              //
              //     )
              //   }),
              // )

            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),

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

  Future<void> getData() async {
    var client = http.Client();
    WeeklySchedule weeklyScheduleModel;
    const url = 'https://notedote.herokuapp.com/weekly_schedule/get-tuesday-schedule/';

    try {
      // print('coba');
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200){
        // print('success!');
        // print(response.body);
        var jsonString = response.body;
        var jsonRes = jsonDecode(jsonString);
        var jumlahData = jsonRes.length;
        print(jumlahData);
        for (var i = 0; i < jumlahData; ++i){
          var jsonMap = json.decode(jsonString)[i];
          print('isi json index ke - ${i}');
          print(jsonMap);
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
      body: Center(
        child: ElevatedButton(
          child: const Text("Get Data Test"),
          onPressed: getData,
        ),
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

  Future<void> getData() async {
    var client = http.Client();
    WeeklySchedule weeklyScheduleModel;
    const url = 'https://notedote.herokuapp.com/weekly_schedule/get-wednesday-schedule/';

    try {
      // print('coba');
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200){
        // print('success!');
        // print(response.body);
        var jsonString = response.body;
        var jsonRes = jsonDecode(jsonString);
        var jumlahData = jsonRes.length;
        print(jumlahData);
        for (var i = 0; i < jumlahData; ++i){
          var jsonMap = json.decode(jsonString)[i];
          print('isi json index ke - ${i}');
          print(jsonMap);
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
      body: Center(
        child: ElevatedButton(
          child: const Text("Get Data Test"),
          onPressed: getData,
        ),
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

  Future<void> getData() async {
    var client = http.Client();
    WeeklySchedule weeklyScheduleModel;
    const url = 'https://notedote.herokuapp.com/weekly_schedule/get-thursday-schedule/';

    try {
      // print('coba');
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200){
        // print('success!');
        // print(response.body);
        var jsonString = response.body;
        var jsonRes = jsonDecode(jsonString);
        var jumlahData = jsonRes.length;
        print(jumlahData);
        for (var i = 0; i < jumlahData; ++i){
          var jsonMap = json.decode(jsonString)[i];
          print('isi json index ke - ${i}');
          print(jsonMap);
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
      body: Center(
        child: ElevatedButton(
          child: const Text("Get Data Test"),
          onPressed: getData,
        ),
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

  Future<void> getData() async {
    var client = http.Client();
    WeeklySchedule weeklyScheduleModel;
    const url = 'https://notedote.herokuapp.com/weekly_schedule/get-friday-schedule/';

    try {
      // print('coba');
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200){
        // print('success!');
        // print(response.body);
        var jsonString = response.body;
        var jsonRes = jsonDecode(jsonString);
        var jumlahData = jsonRes.length;
        print(jumlahData);
        for (var i = 0; i < jumlahData; ++i){
          var jsonMap = json.decode(jsonString)[i];
          print('isi json index ke - ${i}');
          print(jsonMap);
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
      body: Center(
        child: ElevatedButton(
          child: const Text("Get Data Test"),
          onPressed: getData,
        ),
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

  Future<void> getData() async {
    var client = http.Client();
    WeeklySchedule weeklyScheduleModel;
    const url = 'https://notedote.herokuapp.com/weekly_schedule/get-saturday-schedule/';

    try {
      // print('coba');
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200){
        // print('success!');
        // print(response.body);
        var jsonString = response.body;
        var jsonRes = jsonDecode(jsonString);
        var jumlahData = jsonRes.length;
        print(jumlahData);
        for (var i = 0; i < jumlahData; ++i){
          var jsonMap = json.decode(jsonString)[i];
          print('isi json index ke - ${i}');
          print(jsonMap);
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
      body: Center(
        child: ElevatedButton(
          child: const Text("Get Data Test"),
          onPressed: getData,
        ),
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

  Future<void> getData() async {
    var client = http.Client();
    WeeklySchedule weeklyScheduleModel;
    const url = 'https://notedote.herokuapp.com/weekly_schedule/get-sunday-schedule/';

    try {
      // print('coba');
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200){
        // print('success!');
        // print(response.body);
        var jsonString = response.body;
        var jsonRes = jsonDecode(jsonString);
        var jumlahData = jsonRes.length;
        print(jumlahData);
        for (var i = 0; i < jumlahData; ++i){
          var jsonMap = json.decode(jsonString)[i];
          print('isi json index ke - ${i}');
          print(jsonMap);
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
      body: Center(
        child: ElevatedButton(
          child: const Text("Get Data Test"),
          onPressed: getData,
        ),
      ),
    );
  }

}