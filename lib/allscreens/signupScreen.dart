import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ride/allscreens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ride/allscreens/mainscreen.dart';
import 'package:ride/allwidgets/progressbar.dart';
import 'package:ride/main.dart';
// import 'package:firebase_database/firebase_database.dart';



class Signup extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static const String idscreen = "Signup";

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
   Future register(BuildContext context)async{
     showDialog(context: context,barrierDismissible: false, builder: (BuildContext context){
       return ProgressDialog(message: "Authenticating....Please wait",);
     });
     final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).catchError((err){
       Navigator.pop(context);
       Fluttertoast.showToast(msg: "Error: "+err.toString());
     });
     if(userCredential != null){
       Map userDataMap = {
         "name": nameController.text.trim(),
         "email": emailController.text.trim(),
         "phone": phoneController.text.trim()
       };
        FirebaseFirestore.instance.collection('userdata').doc(userCredential.user!.uid).set ({
           "name": nameController.text.trim(),
         "email": emailController.text.trim(),
         "phone": phoneController.text.trim()
          
        });
      //  users.add("data").
      //  firestore.collection("users").path(userCredential.user!.uid).

// For realtime database
      //  userref.child(userCredential.user!.uid).set(userDataMap);
       Fluttertoast.showToast(msg: "User has been created successfuly");

       Navigator.push(context,  MaterialPageRoute(builder: (context) => HomePage()),);
     }else {
       Fluttertoast.showToast(msg: "New user account has not been created");

      //  Fluttertoast.showToast(msg: msg)
     }
     
     }

     
//      try {
//   final UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//     email: emailController.text,
//     password: passwordController.text
//   );
//   // final User user = userCredential.user.uid;
//   //   final uid = user.uid;
  
// } on FirebaseAuthException catch (e) {
//   if (e.code == 'weak-password') {
//     Fluttertoast.showToast(msg: "Password is too weak");
//   } else if (e.code == 'email-already-in-use') {
//     Fluttertoast.showToast(msg: "User on this email already exist");
//   }
//   if(UserCredential != null){
//     Map userdatamap = {
//       "name": nameController.text,
//       "email": emailController.text,
//       "phone": phoneController.text,
//     };
//     userref.child(userCredential.).set(userdatamap);

//   }
// } catch (e) {
//   print(e);
// }
  //   try {
  // UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //   email: emailController.text,
  //   password: passwordController.text
  // );}catch(e){
  //   print(e);
  // }
    

  

  void showtoast(String message, BuildContext context){
    Fluttertoast.showToast(msg: message);
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellowAccent[700],
        title: Center(child: Title(color: Colors.white, child: Text("Sign up")),),),

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
             "SignUp as Rider",
             style: TextStyle(
               fontFamily: "Semi bold",
               fontSize: 24
             ),
           ),
      
           SizedBox(height: 3,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
             child: TextField(
               controller: nameController,
               keyboardType: TextInputType.name,
               decoration: InputDecoration(
                 labelText: "Enter Name",
                 labelStyle: TextStyle(fontSize: 14,
                 fontFamily: "Regular"),
                 
               ),
              
             ),
           ),

           SizedBox(height: 5,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
             child: TextField(
               controller: phoneController,
               keyboardType: TextInputType.phone,
               decoration: InputDecoration(
                 labelText: "Enter Phone Number",
                 labelStyle: TextStyle(fontSize: 14,
                 fontFamily: "Regular")
                 
               ),
              
             ),
           ),

           SizedBox(height: 5,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
             child: TextField(
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
                 if(nameController.text.length < 4){
                   Navigator.pop(context);
                   showtoast("Name Must contains 4 characters", context);
                 }
                 else if(!emailController.text.contains("@")){
                   Navigator.pop(context);
                   showtoast("Email is not valid", context);
                 }
                  else if(phoneController.text.isEmpty){
                    Navigator.pop(context);
                   showtoast("Phone number is required", context);
                 }
                  else if(passwordController.text.length <4){
                    Navigator.pop(context);
                   showtoast("Password is to small", context);
                 }
                 else{register(context);}
               }
               , child: Text("SignUp", style: TextStyle(fontFamily: "Semi bold",
               fontSize: 14),),shape: new RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(14)
               ),)
               ),
               SizedBox(height: 15,),
      
               InkWell(
                 onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
                 },
                child: Text(
                  "already have an account? SignIn.",
                  style: TextStyle(fontSize: 13.5,
                  fontWeight:FontWeight.bold,
                  fontFamily: "Regular"),
                ),
               ),
               SizedBox(height: 10,)
             
      
      
          ],
        ),
      ),
      
    );
  }
}