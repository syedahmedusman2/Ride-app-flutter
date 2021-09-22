import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ride/DataHandler/appData.dart';
import 'package:ride/allscreens/login_screen.dart';
import 'package:ride/allscreens/mainscreen.dart';
import 'package:ride/allscreens/signupScreen.dart';
import 'package:provider/provider.dart';

// FirebaseFirestore firestore = FirebaseFirestore.instance.collection("collectionPath")

DatabaseReference userref = FirebaseDatabase.instance.reference().child("users");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
    // ChangeNotifierProvider(
    //   create: (context)=>AppData(),
    //   child:
       ChangeNotifierProvider(
         create: (context)=>AppData(),
         child: MaterialApp(
          
          title: 'Flutter Demo',
          theme: ThemeData(
            
            
            fontFamily: "Signatra",
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
          // initialRoute: HomePage.idscreen,
          // routes: {
          //   Signup.idscreen: (context) => Signup(),
          //   Login.idscreen: (context) => Login(),
          //   HomePage.idscreen: (context) => HomePage()
          // },
             // ),
           ),
       );
  }
}
