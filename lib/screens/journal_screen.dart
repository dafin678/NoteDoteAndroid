
// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projek_akhir_f07/screens/add-journal.dart';
import 'package:projek_akhir_f07/screens/hex-color.dart';
import 'package:projek_akhir_f07/screens/journal_repository.dart';
import 'package:projek_akhir_f07/screens/update_journal.dart';

import 'package:provider/provider.dart';




class PersonalJournal extends StatelessWidget {
  // This widget is the root of your application.
  static const routeName = '/personal_journal';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      
      
      create: (context) => Repository(),
      child: MaterialApp(
        title: 'Personal Journal',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/home': (context) => JournalList(title: "Personal Journal"),
          '/add-journal': (context) => AddJournal(),
          '/update_journal': (context) => UpdateJournal(),
        },
        debugShowCheckedModeBanner: false,
        home: JournalList(title : "Personal Journal"),
      ),
    );
  }
}

class JournalList extends StatefulWidget {
  

  const JournalList({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  // @override
  // JournalListState createState() => JournalListState();
  @override
  State<StatefulWidget> createState(){
    return JournalListState();
  }

}

class JournalListState extends State<JournalList> {
  int axisCount = 2;
  @override
  Widget build(BuildContext context) {
    final todoP = Provider.of<Repository>(context);
    // Repository repository = Repository();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
        
        backgroundColor: HexColor("#B80F0A"),
        title: Text(widget.title,
        style: GoogleFonts.ubuntu(
          fontSize: 25,
        )
        ,),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).popAndPushNamed('/add-journal'), 
          child: Text('Add Journal',
          style: GoogleFonts.ubuntu(
          fontSize: 25,)),
          style: TextButton.styleFrom(
            primary: Colors.white)),
          IconButton(
                  icon: Icon(
                    axisCount == 2 ? Icons.list : Icons.grid_on,
                    color: Colors.white,
                    size: 25,
                  ),
                  onPressed: () {
                    setState(() {
                      axisCount = axisCount == 2 ? 4 : 2;
                    });
                  },
                )
        ],
      ),
      body: StaggeredGridView.countBuilder(
      physics: BouncingScrollPhysics(),
      crossAxisCount: 4,
      itemCount: todoP.todos.length,
      itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () => Navigator.of(context).popAndPushNamed('/update_journal', 
                arguments: 
                [
                  todoP.todos[index].id.toString(),
                  todoP.todos[index].title,
                  todoP.todos[index].text,
                ],),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black),
                borderRadius: BorderRadius.circular(8.0)),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          todoP.todos[index].title,
                          style: GoogleFonts.ubuntu(
                            fontSize: 20,fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                         todoP.todos[index].text,
                         style: GoogleFonts.ubuntu(
                           fontSize:15, color: Colors.black)
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      staggeredTileBuilder: (int index) => StaggeredTile.fit(axisCount),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    ));
      
    
  }
}