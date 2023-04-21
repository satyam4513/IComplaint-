import 'package:firebase_auth/firebase_auth.dart';
import 'package:icomplaint/Screens/AddComplaint.dart';
import 'package:icomplaint/Screens/Admin/Admin%20view%20complaint.dart';
import 'package:icomplaint/Screens/Admin/Admin_complaint_category/documentcomplaint.dart';
import 'package:icomplaint/Screens/Admin/Admin_complaint_category/examcomplaints_admin.dart';
import 'package:icomplaint/Screens/Admin/Admin_complaint_category/facility_complaints.dart';
import 'package:icomplaint/Screens/Admin/Admin_complaint_category/librarycomplaint.dart';
import 'package:icomplaint/Screens/Admin/Admin_complaint_category/lostfoundcomplaint.dart';
import 'package:icomplaint/Screens/Admin/Approved_complaint.dart';
import 'package:icomplaint/Screens/Admin/pending%20complaints.dart';
import 'package:icomplaint/Screens/Admin/resolved_complaints.dart';
import 'package:icomplaint/Screens/flutterflow/flutterflowTheme.dart';
import 'package:flutter/material.dart';
import 'package:icomplaint/Screens/flutterflow/view%20complaints.dart';
import 'package:icomplaint/Screens/login_demo.dart';
import 'package:icomplaint/Screens/profilepage.dart';
import 'package:icomplaint/Screens/signin.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {

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
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginPage(),
                  ));
                  // Handle profile section tap
                },
              ),
              const Divider(
                color: Colors.grey,
                height: 1,
                thickness: 1,
              ),
              ListTile(
                leading: const Icon(Icons.notifications,color: Color(0xE65E4CF8),),
                title: const Text('Notifications',style: TextStyle(
                    fontSize: 18,fontFamily: 'Roboto'
                ),),
                trailing: const Icon(Icons.arrow_forward_ios,color: Color(0xE65E4CF8),),
                onTap: () {
                  // Handle notifications section tap
                },
              ),
              const Divider(
                color: Colors.grey,
                height: 1,
                thickness: 1,
              ),
              ListTile(
                leading: const Icon(Icons.settings,color:Color(0xE65E4CF8)),
                title: const Text('Settings',style: TextStyle(
                    fontSize: 18,fontFamily: 'Roboto'
                ),),
                trailing: const Icon(Icons.arrow_forward_ios,color: Color(0xE65E4CF8),),
                onTap: () {
                  // Handle settings section tap
                },
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
                            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 10),
                            child: InkWell(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5),
                                      child: CustomElevatedButton(
                                        icon: Icons.list_alt,
                                        label: ' View All complaints',
                                        onPressed: () {
                                          Navigator.push(context,MaterialPageRoute(builder:
                                              (context)=>Admin_view_complaint()),);
                                          // TODO: Implement onPressed action
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: CustomElevatedButton(
                                        icon: Icons.access_time,
                                        label: 'Pending complaints',
                                        onPressed: () {
                                          Navigator.push(context,MaterialPageRoute(builder:
                                              (context)=>pending_complaint()),);
                                          // TODO: Implement onPressed action
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: CustomElevatedButton(
                                        icon: Icons.check,
                                        label: 'Approved complaints',
                                        onPressed: () {
                                          Navigator.push(context,MaterialPageRoute(builder:
                                              (context)=>approved_complaint()),);
                                          // TODO: Implement onPressed action
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: CustomElevatedButton(
                                        icon: Icons.done_all,
                                        label: 'Resolved complaints',
                                        onPressed: () {
                                          Navigator.push(context,MaterialPageRoute(builder:
                                              (context)=>resolved_complaint()),);
                                          // TODO: Implement onPressed action
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: (){

                                  Navigator.push(context,MaterialPageRoute(builder:
                                      (context)=>Admin_view_complaint()),);



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

                            Navigator.push(context,MaterialPageRoute(builder: (context)=>facility_complaint_admin()
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

                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Exam_complaint_admin()
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

                            Navigator.push(context,MaterialPageRoute(builder: (context)=>documentcomplaint_admin()
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

                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Library_Complaint_admin()
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

                            Navigator.push(context,MaterialPageRoute(builder: (context)=>lostfoundcomplaint_admin()
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

////////////////////////////////
class CustomElevatedButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      child: Column(
        children: [
          Icon(icon, size: 38,color: Color.fromARGB(255, 75, 57, 239),),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
