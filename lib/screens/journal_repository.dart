// ignore_for_file: unnecessary_this

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projek_akhir_f07/models/journal_model.dart';

class Repository with ChangeNotifier {
  //final _baseUrl = 'http://127.0.0.1:8000/journals/';
  Repository() {
    this.fetchTasks();
  }

  List<Journal> _todos = [];

  List<Journal> get todos {
    return [..._todos];
  }


  Future postData(String title, String text) async{
      try {
        final response = await http.post(Uri.parse('http://127.0.0.1:8000/api/journal/')
        ,body: {"title":title, "text":text});
        if (response.statusCode == 201){
          notifyListeners();
          return true;
        }
        else{
          return false;
        }
      } catch (e) {
          // ignore: avoid_print
          print(e.toString());
    }
  }

  Future putData(int id, String title, String text) async{
    try {
      final response = await http.put(Uri.parse('http://127.0.0.1:8000/api/journal/${id.toString()}/'),
      body:{'title':title,'text':text});
      if(response.statusCode == 200){
        notifyListeners();
        return true;
      }
      else{
        return false;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future deleteData(int id) async{
    try {
      final response = await http.delete(Uri.parse('http://127.0.0.1:8000/api/journal/${id.toString()}/'));
      
      if(response.statusCode == 204){
        notifyListeners();
        return true;
        
      }
      else{
        return false;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }


  






  fetchTasks() async {
    final url = 'http://127.0.0.1:8000/api/journal/?format=json';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _todos = data.map<Journal>((json) => Journal.fromJson(json)).toList();
      notifyListeners();
    }
  }
}







