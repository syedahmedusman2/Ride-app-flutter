import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ride/allscreens/mainscreen.dart';
import 'package:ride/allscreens/signupScreen.dart';
import 'package:ride/allwidgets/progressbar.dart';

class Login extends StatelessWidget {
    static const String idscreen = "Login";
    FirebaseAuth auth = FirebaseAuth.instance;

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    void login(BuildContext context)async{
     showDialog(context: context, barrierDismissible: false, builder: (BuildContext context){
       return ProgressDialog(message: "Authenticating....Please wait",);
     });
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password:passwordController.text);
       Navigator.push(context,  MaterialPageRoute(builder: (context) => HomePage()),);
              Fluttertoast.showToast(msg: "Logged in");

        // if(userCredential != null){
        //   FirebaseFirestore firestore = FirebaseFirestore.instance;
        //   FirebaseFirestore.instance.collection('userdata').doc(userCredential.user!.uid).get().then(DataSnapshot snap){


        //   });
        // }
        
      } on FirebaseAuthException catch(e){
        if (e.code == 'user-not-found') {
          Navigator.pop(context);
    Fluttertoast.showToast(msg: 'No user found for that email.');
  } else if (e.code == 'wrong-password') {
    Navigator.pop(context);
    Fluttertoast.showToast(msg: 'Wrong password provided for that user.');
  } 
  
      } 
      


    }

    
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellowAccent[700],
        title: Center(child: Title(color: Colors.white, child: Text("Login")),),),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 35,),
      
           Center(
             child: Image(image: AssetImage(
               'assests/images/logo.png'
             ),
             width: 390,
             height: 250,
             alignment: Alignment.center,
             ),
           ),
           SizedBox(height: 5,),
           Text(
             "Login as Rider",
             style: TextStyle(
               fontFamily: "Semi bold",
               fontSize: 24
             ),
           ),
      
           SizedBox(height: 3,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
             child: TextFormField(
               controller: emailController,
               keyboardType: TextInputType.emailAddress,
               decoration: InputDecoration(
                 labelText: "Enter Email Address",
                 labelStyle: TextStyle(fontSize: 14,
                 fontFamily: "Regular")
                 
               ),
              
             ),
           ),
           SizedBox(height: 5,),
      
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
             child: TextFormField(
               controller: passwordController,
               obscureText: true,
               decoration: InputDecoration(
                 labelText: "Enter Password",
                 labelStyle: TextStyle(fontSize: 14,
                 fontFamily: "Regular")
                 
               ),
              
             ),
           ),
      
           // ignore: deprecated_member_use
           Container(
             height: 50,
             width: 200,
             
             child: RaisedButton(
               color: Colors.yellowAccent[700], 
               textColor: Colors.white,
      
               onPressed: (){
                 login(context);
               }, child: Text("Login", style: TextStyle(fontFamily: "Semi bold",
               fontSize: 14),),shape: new RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(14)
               ),)
               ),
               SizedBox(height: 15,),
      
               InkWell(
                 onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Signup()));
                 },
                child: Text(
                  "Not have an account? Register.",
                  style: TextStyle(fontSize: 13.5,
                  fontWeight:FontWeight.bold,
                  fontFamily: "Regular"),
                ),
               )
             
      
      
          ],
        ),
      ),
      
    );
  }
}