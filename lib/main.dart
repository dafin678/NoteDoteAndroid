import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> fetch() async {
    const url = 'http://127.0.0.1:8000/profile/tes';
    try {
      final response = await http.get(Uri.parse(url));
      print(response.body);
      Map<String, dynamic> extractedData = jsonDecode(response.body);
      extractedData.forEach((key, val) {
        print(val);
      });
    } catch (error) {
      print(error);
    }
  }


void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: ElevatedButton(
	      onPressed: () => fetch(),
	        child: Text(' Function Without Argument '),
	      )
      ),
    );
  }
}