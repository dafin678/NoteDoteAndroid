import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projek_akhir_f07/cookie_request.dart';
import '/widgets/main_drawer.dart';
import '/screens/profile_screen.dart';
import '/screens/profile_edit_screen.dart';
import '/screens/login.dart';
import '/screens/weekly_schedule.dart';
import '/screens/notes.dart';
import 'package:projek_akhir_f07/models/notes_collection.dart';
import '/screens/task_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => NotesCollection(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) {
          CookieRequest request = CookieRequest();
          return request;
        },
        child: MaterialApp(
          title: 'NoteDote',
          debugShowCheckedModeBanner: false,
          // initialRoute: LoginPage.routeName, // default is '/'
          initialRoute: LoginPage.routeName, // default is '/'
          theme: ThemeData.dark(),
          routes: {
            '/': (ctx) => const MyHomePage(title: 'NoteDote'),
            ProfileScreen.routeName: (ctx) => const ProfileScreen(),
            ProfileEditScreen.routeName: (ctx) => const ProfileEditScreen(),
            LoginPage.routeName: (ctx) => const LoginPage(),
            WeeklySchedules.routeName: (ctx) => const WeeklySchedules(),
            ScheduleForm.routeName: (ctx) => const ScheduleForm(),
            NoteHome.routeName: (ctx) => const NoteHome(),
            Task.routeName: (ctx) => const Task(
                  title: 'Task',
                ),
          },
          onGenerateRoute: (settings) {
            // ignore: avoid_print
            print(settings.arguments);
          },
          onUnknownRoute: (settings) {
            return MaterialPageRoute(
              builder: (ctx) => const MyHomePage(title: 'NoteDote'),
            );
          },
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Hello!',
            ),
          ],
        ),
      ),
    );
  }
}
