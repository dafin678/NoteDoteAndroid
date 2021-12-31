import 'package:flutter/material.dart';
 
void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}
 
class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}
 
class _State extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Sample App'),
        // ),
        body: Container(
            // padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://images.pexels.com/photos/8472946/pexels-photo-8472946.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"),
                fit: BoxFit.cover
            ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'NoteDote',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ElevatedButton(
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: () {
                        debugPrint(nameController.text);
                        debugPrint(passwordController.text);
                      },
                    )),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text('Don\'t have account?'),
                      TextButton(
                        child: Text('Sign Up'),
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                        ),
                        onPressed: () {
                          //signup screen
                        },
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}