import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projek_akhir_f07/cookie_request.dart';
import '/widgets/main_drawer.dart';
import '/screens/profile_screen.dart';
import '/screens/login.dart';

void main() {
  runApp(const MyApp());
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
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: LoginPage.routeName, // default is '/'
          routes: {
            '/': (ctx) => const MyHomePage(title: 'NoteDote'),
            ProfileScreen.routeName: (ctx) => const ProfileScreen(),
            ProfileEditScreen.routeName: (ctx) => const ProfileEditScreen(),
            LoginPage.routeName: (ctx) => const LoginPage(),
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
