import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icomplaint/Screens/Admin/AdminHome.dart';
import 'package:icomplaint/Screens/HomeScreenMain.dart';
import 'package:icomplaint/Screens/forgotPassword.dart';
import 'package:icomplaint/Screens/homescreen.dart';
import 'package:icomplaint/Screens/signup.dart';
import 'package:icomplaint/reusable_widget/reusable_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';




class Adminsignin extends StatefulWidget {
  const Adminsignin({Key? key}) : super(key: key);

  @override
  State<Adminsignin> createState() => _AdminsigninState();
}

class _AdminsigninState extends State<Adminsignin> {

  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  bool showspinner=false;

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

                      "Enter AdminID", Icons.person_outline, false,
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
                          MaterialPageRoute(builder: (context) => const AdminHome()));
                      final snackbar =SnackBar(content: Text("Hello Admin,Welcome to IComplaint!"),elevation: 20,backgroundColor: Colors.blue,
                        action: SnackBarAction(textColor: Colors.white, label: '', onPressed: () {  },),);
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      setState(() {
                        showspinner=false;
                      });
                    }).onError((error, stackTrace){
                      print("Error ${error.toString()}");
                      final snackbar =SnackBar(content: Text("Admin Credentials are Invalid!"),elevation: 20,backgroundColor: Colors.blue,
                        action: SnackBarAction(textColor: Colors.white, label: '', onPressed: () {  },),);
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      setState(() {
                        showspinner=false;
                      });
                    });
                  }),

                ],
              ),
            ),
          ),),
      ),);
  }

}



