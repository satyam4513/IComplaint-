//import 'dart:ffi';

//import 'package:dropdownfield/dropdownfield.dart';
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:icomplaint/Screens/HomeScreenMain.dart';
import 'package:icomplaint/reusable_widget/reusable_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);


  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
CollectionReference userId= FirebaseFirestore.instance.collection('userId');



class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();
  String valueChoose="BSc.IT";
  bool showspinner=false;
 late String username;
 // late String department;
  List listitem=[
    "BSc.IT","BSc.CS","B.COM","B.COM(A&F)","BBI","BMM","BMS","BSc.DS","BFM"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0,10,5,8),
            child: const Center(
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Color(0xE65E4CF8)),
              ),
            ),

          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: SingleChildScrollView(

          child: Container(
            width: MediaQuery
                  .of(context)
                  .size
                  .width,
            height: MediaQuery
                  .of(context)
                  .size
                  .height,
            decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.white,Colors.white24
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Padding(

                  padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
                  child: Column(
                    children: <Widget>[


                      const SizedBox(
                        height: 10,
                      ),
                      reusableTextField(

                          "Enter UserName", Icons.person_outline, false,
                          _userNameTextController,(value){
                        {
                          username=value;
                        }
                      }),
                      const SizedBox(
                        height: 10,
                      ),


                      reusableTextField(

                          "Enter Email Id", Icons.person_outline, false,
                          _emailTextController,(value){




    }),
                      const SizedBox(
                        height: 10,
                      ),
                      reusableTextField(

                          "Enter Password", Icons.lock_outlined, true,
                          _passwordTextController,(value){


    }),

                      const SizedBox(
                        height: 10,
                      ),

                    Container(
                      padding: const EdgeInsets.only(left: 16,right: 16,bottom: 7),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white,width: 1),
                          borderRadius: BorderRadius.circular(20),
                          color:const Color(0xE65E4CF8),
                        ),
                        child: DropdownButton(

                          hint: const Text("Select Department "),
                            dropdownColor: const Color(0xE65E4CF8),

                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 22,
                            isExpanded: true,
                            underline: const SizedBox(),
                            style: const TextStyle(
                              color: Colors.white,fontSize: 18

                            ),
                           value:valueChoose , onChanged: (newValue){
                                                    setState(() {
                                                      valueChoose = newValue as String;

    });
    },

    items: listitem.map((valueItem){
        return DropdownMenuItem(value:valueItem,child: Text(valueItem),);
    }).toList(),
                        )


                    ),






                      firebaseUIButton(context, false, () {
                        if(_userNameTextController.text.isEmpty){
                          final snackbar =SnackBar(content: Text("User Name can not be empty."),elevation: 20,backgroundColor: Colors.blue,
                            action: SnackBarAction(textColor: Colors.white, label: '', onPressed: () {  },),);
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        }
                        if(_passwordTextController.text.isEmpty){
                          final snackbar =SnackBar(content: Text("Please enter a valid Password."),elevation: 20,backgroundColor: Colors.blue,
                            action: SnackBarAction(textColor: Colors.white, label: '', onPressed: () {  },),);
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        }
                        if(_emailTextController.text.isEmpty){
                          final snackbar =SnackBar(content: Text("Please enter a valid EmailID."),elevation: 20,backgroundColor: Colors.blue,
                            action: SnackBarAction(textColor: Colors.white, label: '', onPressed: () {  },),);
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        }
                        if(valueChoose.isEmpty){
                          final snackbar =SnackBar(content: Text("Please Select your Department"),elevation: 20,backgroundColor: Colors.blue,
                            action: SnackBarAction(textColor: Colors.white, label: '', onPressed: () {  },),);
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        }
                        if(_userNameTextController.text.isEmpty==false
                            && _emailTextController.text.isEmpty==false &&
                            _passwordTextController.text.isEmpty==false
                            && valueChoose.isEmpty==false

                        ){
                          setState(() {
                            showspinner = true;
                          });

                        }


                          else {
                          setState(() {
                            showspinner = false;
                          });
                        }
                        if(_userNameTextController.text.isEmpty==false
                            && _emailTextController.text.isEmpty==false &&
                            _passwordTextController.text.isEmpty==false
                            && valueChoose.isEmpty==false

                        ) {
                          setState(() {
                            showspinner = true;
                          });


                          FirebaseAuth.instance.createUserWithEmailAndPassword
                            (email: _emailTextController.text,
                              password: _passwordTextController.text)
                              .then((value) {
                            username = _userNameTextController.text;
                            userId.add({
                              'uid':FirebaseAuth.instance.currentUser!.uid,
                              'user_name': username,
                              'user_department': valueChoose
                            }).then((value) => print("user added"));
                            print("Created new account Successfully");

                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (
                                        context) => const HomescreenWidget()));
                            setState(() {
                              showspinner = false;
                            });
                          }).onError((error, stackTrace) {
                            print("Error ${error.toString()}");
                          });
                          username = _userNameTextController.text;
                          userId.add({
                            'uid':FirebaseAuth.instance.currentUser!.uid,
                            'user_name': username,
                            'user_department': valueChoose
                          }).then((value) => print("user added"));
                          print(username);
                        }



                      })
                      ],
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
