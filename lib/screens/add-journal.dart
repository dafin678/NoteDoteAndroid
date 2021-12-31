//  file_names
// file_names
// file_names

// ignore_for_file: import_of_legacy_library_into_null_safe, avoid_unnecessary_containers, avoid_print, file_names, unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projek_akhir_f07/screens/hex-color.dart';
import 'package:projek_akhir_f07/screens/journal_repository.dart';
import 'package:provider/provider.dart';

class AddJournal extends StatefulWidget {
  const AddJournal({ Key? key }) : super(key: key);

  @override
  _AddJournalState createState() => _AddJournalState();
}

class _AddJournalState extends State<AddJournal> {
  final todoTitleController = TextEditingController();
  final todoTextController = TextEditingController();

  Repository repository = Repository();




  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 90,
          automaticallyImplyLeading: false,
          
          backgroundColor: HexColor("#B80F0A"),
          title: Text('My Journal',
          style: GoogleFonts.ubuntu(
            fontSize: 25,
          )
          ,),
            elevation: 0,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).popAndPushNamed('/home');
                }),
            actions: <Widget>[
              TextButton(
               onPressed: () async {
              bool response = await repository.postData(todoTitleController.text, todoTextController.text);
                if(response == true){
                  Navigator.of(context).popAndPushNamed('/home');
                }
                else{
                  // avoid_print
                  print("ADA ERROR");
                }  
              }, 
                    child: Text('Save',
                    style: GoogleFonts.ubuntu(
                    fontSize: 25,
                    ),),
                    style: TextButton.styleFrom(
                    primary: Colors.white,)),

            ],
          ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          
          children: [
          Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      style: GoogleFonts.ubuntu(
                            fontSize: 20,fontWeight: FontWeight.bold
                      ),
                      controller: todoTitleController,
                      maxLength: 255,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'Ubuntu'
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          )
                        ),
                        // hintText: 'Title',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:Colors.black,
                          )
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width:2,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        )
                      ),
                    ),
                  ),
          Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: TextField(
                      style: GoogleFonts.ubuntu(
                           fontSize:17, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.multiline,
                      maxLines: 20,
                      maxLength: 10000,
                      controller: todoTextController,
                      decoration: InputDecoration(
                        labelText: 'Text',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'Ubuntu'
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          )
                        ),
                        // hintText: 'Text Description',
                         border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:Colors.black,
                          )
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width:2,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
          
        ],),
      ),
        
      );
  
  }
}