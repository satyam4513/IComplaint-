import 'package:flutter/material.dart';
import 'package:icomplaint/Screens/admin_signin.dart';
import 'package:icomplaint/Screens/signin.dart';
import 'package:icomplaint/Screens/signup.dart';


class welcomescreen extends StatelessWidget {
  const welcomescreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body:Padding(
        padding:const EdgeInsets.all(16),
        child:
        Column(
          mainAxisAlignment:MainAxisAlignment.spaceAround,
          crossAxisAlignment:CrossAxisAlignment.center,
          mainAxisSize:MainAxisSize.max,
          children: [
            Align(
              alignment:const Alignment(0.0, 0.4),
              child:
              Column(
                mainAxisAlignment:MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisSize:MainAxisSize.max,
                children: [
                  const Padding(
                    padding:EdgeInsets.fromLTRB(0, 180, 0, 0),
                    child:Align(
                      alignment:Alignment(0.1, -0.1),
                      child:///***If you have exported images you must have to copy those images in assets/images directory.
                      Image(
                        image:AssetImage("assets/images/icomplaint_logo.png"),
                        height:170,
                        width:170,
                        fit:BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding:const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child:Row(
                      mainAxisAlignment:MainAxisAlignment.start,
                      crossAxisAlignment:CrossAxisAlignment.center,
                      mainAxisSize:MainAxisSize.min,
                      children:const [

                        Padding(
                          padding:EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child:Text(
                            "Logo",
                            textAlign: TextAlign.start,
                            overflow:TextOverflow.clip,
                            style:TextStyle(
                              fontWeight:FontWeight.w700,
                              fontStyle:FontStyle.normal,
                              fontSize:16,
                              color:Color(0xffffffff),
                            ),
                          ),
                        ),
                      ],),),
                ],),),

            Column(
              mainAxisAlignment:MainAxisAlignment.start,
              crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisSize:MainAxisSize.max,
              children: [
                MaterialButton(
                  onPressed:(){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>const SignUpScreen()),);

                  },
                  color:const Color(0xFF4B39EF),
                  elevation:0,
                  shape:RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(22.0),
                  ),
                  padding:const EdgeInsets.all(16),
                  textColor:const Color(0xff000000),
                  height:50,
                  minWidth:MediaQuery.of(context).size.width,
                  child:const Text("SIGN UP", style: TextStyle( fontSize:16,
                    fontWeight:FontWeight.w700,
                    fontStyle:FontStyle.normal,
                  ),),
                ),
                Padding(
                  padding:const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child:MaterialButton(
                    onPressed:(){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>const SignInScreen()),);

                    },
                    color:const Color(0xE6F3DE54),
                    elevation:0,
                    shape:RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(22.0),
                    ),
                    padding:const EdgeInsets.all(16),
                    textColor:const Color(0xff5e5c5c),
                    height:50,
                    minWidth:MediaQuery.of(context).size.width,
                    child:const Text("SIGN IN", style: TextStyle( fontSize:16,
                      fontWeight:FontWeight.w700,
                      fontStyle:FontStyle.normal,
                    ),),
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child:MaterialButton(
                    onPressed:(){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>const Adminsignin()),);

                    },
                    color:const Color(0xffffffff),
                    elevation:0,
                    shape:RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(22.0),
                      side:const BorderSide(color:Color(0xffffffff),width:1),
                    ),
                    padding:const EdgeInsets.all(16),
                    textColor:const Color(0xff000000),
                    height:40,
                    minWidth:140,
                    child:const Text("Are you an Admin?Click Here", style: TextStyle( fontSize:16,
                      fontWeight:FontWeight.w700,
                      fontStyle:FontStyle.italic,
                    ),),
                  ),
                ),
              ],),
          ],),),
    )
    ;}
}