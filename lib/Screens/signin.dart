import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icomplaint/Screens/HomeScreenMain.dart';
import 'package:icomplaint/Screens/forgotPassword.dart';
import 'package:icomplaint/Screens/homescreen.dart';
import 'package:icomplaint/Screens/signup.dart';
import 'package:icomplaint/reusable_widget/reusable_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';




class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  bool showspinner=false;

  CollectionReference userId= FirebaseFirestore.instance.collection('userId');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: Container(decoration: const BoxDecoration(gradient: LinearGradient(colors:
        [Colors.white, Colors.white24],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight)),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, MediaQuery
                  .of(context)
                  .size
                  .height * 0.15, 20, 0),
              child: Column(
                children: <Widget>[
                  logoWidget("assets/images/icomplaint_logo.png"),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField(

                      "Enter EmailID", Icons.person_outline, false,
                      _emailTextController,(value){


    }),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField(

                      "Enter Password", Icons.lock_outline, true,
                      _passwordTextController, (value){


    }),
                  const SizedBox(
                    height: 7,
                  ),
                  forgetPassword(context),
                  firebaseUIButton(context, true, () {
                    if(
                    _emailTextController.text.isEmpty&&_passwordTextController.text.isEmpty
                    ){
                      setState(() {
                        showspinner=false;
                      });
                    }
                    else{
                      setState(() {
                        showspinner=true;
                      });
                    }
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                        .then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const HomescreenWidget()));
                      final snackbar =SnackBar(content: Text("Hi,Welcome to IComplaint!"),elevation: 20,backgroundColor: Colors.blue,
                        action: SnackBarAction(textColor: Colors.white, label: '', onPressed: () {  },),);
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      setState(() {
                        showspinner=false;
                      });
                    }).onError((error, stackTrace){
                      print("Error ${error.toString()}");
                      final snackbar =SnackBar(content: Text("User Credentials are Invalid!"),elevation: 20,backgroundColor: Colors.blue,
                        action: SnackBarAction(textColor: Colors.white, label: '', onPressed: () {  },),);
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      setState(() {
                        showspinner=false;
                      });
                    });
                  }),
                  signUpOption()
                ],
              ),
            ),
          ),),
      ),);
  }


  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => forgotpassword())),
      ),
    );
  }
}



