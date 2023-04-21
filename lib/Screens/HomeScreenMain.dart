import 'package:firebase_auth/firebase_auth.dart';
import 'package:icomplaint/Screens/AddComplaint.dart';
import 'package:icomplaint/Screens/complaint%20categories/Library.dart';
import 'package:icomplaint/Screens/complaint%20categories/document.dart';
import 'package:icomplaint/Screens/complaint%20categories/exam.dart';
import 'package:icomplaint/Screens/complaint%20categories/facility.dart';
import 'package:icomplaint/Screens/complaint%20categories/lostfound.dart';
import 'package:icomplaint/Screens/flutterflow/flutterflowTheme.dart';
import 'package:flutter/material.dart';
import 'package:icomplaint/Screens/login_demo.dart';
import 'package:icomplaint/Screens/mycomplaints.dart';
import 'package:icomplaint/Screens/profilepage.dart';
import 'package:icomplaint/Screens/signin.dart';

import 'flutterflow/view complaints.dart';

class HomescreenWidget extends StatefulWidget {
  const HomescreenWidget({Key? key}) : super(key: key);

  @override
  _HomescreenWidgetState createState() => _HomescreenWidgetState();
}

class _HomescreenWidgetState extends State<HomescreenWidget> {

  final scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {


     return WillPopScope(
      onWillPop: () async => false, // Disable back button
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF1F4F8),
          appBar: AppBar(
            title: const Text("Welcome to IComplaint"),
            backgroundColor:const Color.fromARGB(255, 75, 57, 239),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors:[Color(0xFF4B39EF),Color(0xFF4B39EF)])
                  ),
                    child: Container(
                      child: Column(
                        children: [
                          Material(
                            borderRadius: const BorderRadius.all(Radius.circular(150.0)),
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                              child: Image.asset("assets/images/output-onlinepngtools (1).png",width: 80,height: 80,),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Welcome To IComplaint",style:
                            TextStyle(color: Colors.white,fontFamily:
                            'Roboto',fontWeight: FontWeight.bold,fontSize: 20.0),),
                          )
                        ],
                      ),
                    )),
                const Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 1,
                ),

                ListTile(
                  leading: const Icon(Icons.person,color: Color(0xE65E4CF8),),
                  title: const Text('Profile',style: TextStyle(
                      fontSize: 18,fontFamily: 'Roboto'
                  ),),
                  trailing: const Icon(Icons.arrow_forward_ios,color: Color(0xE65E4CF8),),
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>ProfilePage(),
                    ));
                    // Handle profile section tap
                  },
                ),
                const Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 1,
                ),

                const Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 1,
                ),

                const Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 1,
                ),
                ListTile(
                  leading: const Icon(Icons.logout,color: Color(0xE65E4CF8),),
                  title: const Text('Logout',style: TextStyle(
                      fontSize: 18,fontFamily: 'Roboto'
                  ),),
                  trailing: const Icon(Icons.arrow_forward_ios,color: Color(0xE65E4CF8),),
                  onTap: () {
                    // Handle logout section tap
                    FirebaseAuth.instance.signOut().then((value) {
                      print("Signed Out");
                      Navigator.of(context).pop();
                      Navigator
                          .of(context)
                          .pushReplacement(
                          MaterialPageRoute(
                              builder: (BuildContext context) => const SignInScreen(
                              )
                          )
                      );
                    });
                  },
                ),
                const Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 1,
                ),
              ],
            ),
          ),

        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                      width: double.infinity,
                      height: 110,
                      decoration: const BoxDecoration(),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                            child: InkWell(
                              child: Container(
                                width: 120,
                                height: 190,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x230E151B),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(1, 1, 1, 1),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 4),
                                        child: Icon(
                                          Icons.add_comment,
                                          color: Color.fromARGB(255, 75, 57, 239),
                                          size: 44,
                                        ),
                                      ),
                                      Align(
                                        alignment: const AlignmentDirectional(0.45, 0),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                          child: Text(
                                            'Add Complaint',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1
                                                .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                ),
                              ),
                                onTap: (){

                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>const AddComplaintWidget()),);



                                }
                            ),

                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 0, 8),
                            child: InkWell(
                              child: Container(
                                width: 120,
                                height: 190,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x230E151B),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 4),
                                        child: Icon(
                                          Icons.grid_view,
                                          color: Color.fromARGB(255, 75, 57, 239),
                                          size: 44,
                                        ),
                                      ),
                                      Text(
                                        'View Complaints',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                                onTap: (){

                                  Navigator.push(context,MaterialPageRoute(builder:
                                      (context)=>const user_view_complaint()),);



                                }
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 0, 8),
                            child: InkWell(

                              child: Container(
                                width: 120,
                                height: 190,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x230E151B),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 4),
                                        child: Icon(
                                          Icons.account_box_outlined,
                                          color: Color.fromARGB(255, 75, 57, 239),
                                          size: 44,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: Text(
                                          'My Complaints',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                                onTap: (){

                                  Navigator.push(context,MaterialPageRoute(builder:
                                      (context)=>const my_complaints()),);



                                }
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                          child: Text(
                            'Complaint Categories',
                            style:
                            FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Roboto',
                              color: const Color(0xFF57636C),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 44),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        InkWell(
                        onTap: (){

                  Navigator.push(context,MaterialPageRoute(builder: (context)=>CarouselPage()
                   ),);
                  },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: 190,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x230E151B),
                                  offset: Offset(0, 2),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/college_facilities.jpg',
                                      width: double.infinity,
                                      height: 115,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsetsDirectional.fromSTEB(8, 12, 0, 0),
                                    child: Text(
                                      'Facility Realated',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                        fontFamily: 'Roboto',
                                        color: const Color(0xFF14181B),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){

                            Navigator.push(context,MaterialPageRoute(builder: (context)=>exam()
                            ),);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: 190,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x230E151B),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/examd.jpg',
                                      width: double.infinity,
                                      height: 115,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsetsDirectional.fromSTEB(8, 12, 0, 0),
                                    child: Text(
                                      'Exam related',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                        fontFamily: 'Roboto',
                                        color: const Color(0xFF14181B),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){

                            Navigator.push(context,MaterialPageRoute(builder: (context)=>document()
                            ),);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: 190,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x230E151B),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/document.jpg',
                                      width: double.infinity,
                                      height: 115,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsetsDirectional.fromSTEB(8, 12, 0, 0),
                                    child: Text(
                                      'Document Related',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                        fontFamily: 'Roboto',
                                        color: const Color(0xFF14181B),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){

                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Library()
                            ),);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: 190,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x230E151B),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/library.jpg',
                                      width: double.infinity,
                                      height: 115,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsetsDirectional.fromSTEB(8, 12, 0, 0),
                                    child: Text(
                                      'Library Related',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                        fontFamily: 'Roboto',
                                        color: const Color(0xFF14181B),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){

                            Navigator.push(context,MaterialPageRoute(builder: (context)=>lostfound()
                            ),);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: 190,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x230E151B),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/lost.png',
                                      width: double.infinity,
                                      height: 115,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsetsDirectional.fromSTEB(8, 12, 0, 0),
                                    child: Text(
                                      'Lost your Belongings?',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                        fontFamily: 'Roboto',
                                        color: const Color(0xFF14181B),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}

class CustomList extends StatelessWidget{

  IconData icon;
  String text;
  Function onTap;


  CustomList(this.icon,this.text,this.onTap);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        height: 55,
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade400))
          ),
          child: InkWell(
              splashColor: const Color(0xFF4B39EF),
              onTap:()=>{

              },

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(icon),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(text,style: const TextStyle(
                            fontSize: 18,fontFamily: 'Roboto'
                        ),),
                      ),

                    ],
                  ),
                  const Icon(Icons.arrow_right)
                ],
              )
          ),
        ),
      ),
    );
  }


}
