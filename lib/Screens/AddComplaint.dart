import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:icomplaint/Screens/HomeScreenMain.dart';
import 'package:icomplaint/Screens/flutterflow/flutterflowicon.dart';
import 'package:icomplaint/Screens/flutterflow/flutterflowDropdown.dart';
import 'package:icomplaint/Screens/flutterflow/flutterflowTheme.dart';
import  'package:icomplaint/Screens/flutterflow/flutterflowWidgets.dart';
import 'package:flutter/material.dart';



class AddComplaintWidget extends StatefulWidget {
  const AddComplaintWidget({Key? key}) : super(key: key);

  @override
  _AddComplaintWidgetState createState() => _AddComplaintWidgetState();
}

class _AddComplaintWidgetState extends State<AddComplaintWidget> {



  String? dropDownValue1;
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  String? dropDownValue2;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  CollectionReference Complaint_data =FirebaseFirestore.instance.collection('Complaint_data1');
  late List<Map<String, dynamic>> dataList=[];

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();

    super.initState();
    getDataFromFirestore().then((value) {
      setState(() {
        dataList = value;
      });
    });
  }
  Future<List<Map<String, dynamic>>> getDataFromFirestore() async {
    List<Map<String, dynamic>> dataList = [];
    final QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection('userId').where('uid',isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();

    snapshot.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      dataList.add(data);
    });


    return dataList;

  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    super.dispose();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),

          child: Padding(
            padding: const EdgeInsets.only(left: 0.0,bottom: 10),
            child: Container(
              height: 120,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50)
                  ),
                  color:Color.fromARGB(255, 75, 57, 239)
              ),
              child: Stack(
                children: [
                  Positioned(
                      top:50,
                      left: 0,

                      child: Container(
                          height: 40,
                          width: 220,

                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50)
                            ),
                          ))
                  )
                  ,const Positioned(
                      top: 55,
                      left: 35,
                      child: Text("Add Complaint",style:
                      TextStyle(fontSize: 25,color:Color(0xFF363f93),fontWeight: FontWeight.bold)))

                ],

              ),
            ),
          )

      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1, 0.05),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                    child: Text(
                      'Title',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).subtitle1.override(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-0.1, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: TextFormField(
                      controller: textController1,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Enter complaint Tittle',
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1, 0.05),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                    child: Text(
                      'Description',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).subtitle1.override(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-0.1, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: TextFormField(
                      controller: textController2,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Enter complaint Description',
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        prefixIcon: const Icon(
                          Icons.text_snippet,
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Roboto',
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                    ),
                  ),
                ),

                Align(
                  alignment: const AlignmentDirectional(-1, 0.05),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                    child: Text(
                      'Complaint Type',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).subtitle1.override(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-0.75, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                    child: FlutterFlowDropDown(
                      options: const [
                        'Facility related',
                        'exam related',
                        'Document related',
                        'Library related',
                        'Lost and Found'
                      ],
                      onChanged: (val) => setState(() => dropDownValue1 = val),
                      width: 355,
                      height: 50,
                      textStyle:
                      FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Roboto',
                      ),
                      hintText: 'Select Complaint Type',
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      borderRadius: 0,
                      margin: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1, 0.05),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                    child: Text(
                      ' User Name',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).subtitle1.override(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-0.1, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: TextFormField(
                      controller: textController3,
                      autofocus: true,
                      obscureText: false,

                      decoration: InputDecoration(
                        hintText: "Enter User Name ",

                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),


                Align(
                  alignment: const AlignmentDirectional(-1, 0.05),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                    child: Text(
                      'User Department',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).subtitle1.override(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-0.8, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                    child: FlutterFlowDropDown(
                      options: const [
                        'BSc.IT',
                        'BSc.CS',
                        'B.COM',
                        'B.COM(A&F)',
                        'BMS',
                        'BBI',
                        'BMM',
                        'BSc.DS',
                        'BFM'
                      ],
                      onChanged: (val) => setState(() => dropDownValue2 = val),
                      width: 350,
                      height: 50,
                      textStyle:
                      FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Roboto',
                      ),
                      hintText: 'Select User Department',
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      borderRadius: 0,
                      margin: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 20, 20),
                  child: FFButtonWidget(


                    onPressed: () {
                      if(textController1!.text.isEmpty){
                        final snackbar =SnackBar(content: Text("Complaint title can not be empty."),elevation: 20,backgroundColor: Colors.blue,
                          action: SnackBarAction(textColor: Colors.white, label: '', onPressed: () {  },),);
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }
                      if(textController2!.text.isEmpty){
                        final snackbar =SnackBar(content: Text("Complaint description can not be empty."),elevation: 20,backgroundColor: Colors.blue,
                          action: SnackBarAction(textColor: Colors.white, label: '', onPressed: () {  },),);
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }

                      if(dropDownValue1==null){                        final snackbar =SnackBar(content: Text("Please Select the Complaint type."),elevation: 20,backgroundColor: Colors.blue,
                          action: SnackBarAction(textColor: Colors.white, label: '', onPressed: () {  },),);
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }
                      if(textController3!.text.isEmpty){
                        final snackbar =SnackBar(content: Text("User Name can not be empty."),elevation: 20,backgroundColor: Colors.blue,
                          action: SnackBarAction(textColor: Colors.white, label: '', onPressed: () {  },),);
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }


                      if(dropDownValue2==null){
                        final snackbar =SnackBar(content: Text("Please Select the User Department."),elevation: 20,backgroundColor: Colors.blue,
                          action: SnackBarAction(textColor: Colors.white, label: '', onPressed: () {  },),);
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }

                      ////
                      String id = DateTime.now().millisecondsSinceEpoch.toString();
                      if(textController1?.text.isEmpty==false
                          && textController2?.text.isEmpty==false &&
                          textController3?.text.isEmpty==false
                          && dropDownValue1!.isEmpty==false
                          && dropDownValue2!.isEmpty==false
                      ) {
                        CollectionReference colref =
                        FirebaseFirestore.instance.collection('userId');
                        Complaint_data.doc(id).set(
                            {'Complaint_Tittle': textController1?.text,
                              'Complaint_type': dropDownValue1,
                              'description': textController2?.text,
                              'rollno': (textController4?.text),
                              'user_name': dataList[0]['user_name'],
                              'user department': dropDownValue2,
                              'Date': DateTime.now(),
                              'status': "Pending",
                              'id': id,
                              'uid': FirebaseAuth.instance.currentUser!.uid
                            });
                      }
                      print('Button pressed ...');
                      final snackbar =SnackBar(content: Text("Complaint Added Successfully!"),elevation: 20,backgroundColor: Colors.blue,
                        action: SnackBarAction(textColor: Colors.white, label: '', onPressed: () {  },),);
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);


                    },
                    text: 'Submit',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                      FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 8.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}