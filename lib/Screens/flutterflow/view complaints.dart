import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icomplaint/Screens/viewComplaintDetails.dart';
import 'package:intl/intl.dart';
import  'package:icomplaint/Screens/flutterflow/flutterflowWidgets.dart';
import 'package:icomplaint/Screens/flutterflow/flutterflowTheme.dart';


class user_view_complaint extends StatefulWidget {
  const user_view_complaint({Key? key}) : super(key: key);
  @override
  user_view_complaintState createState() => user_view_complaintState();
}

class user_view_complaintState extends State<user_view_complaint> {
  //////
  late List<Map<String, dynamic>> dataList=[];

  @override
  void initState() {
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
    await FirebaseFirestore.instance.collection('Complaint_data1').get();

    snapshot.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      dataList.add(data);
    });


    return dataList;
  }

  /////////
  List<String> sel = [];
  @override
  @override
  Widget build(BuildContext context) {
    String formatTimestamp(Timestamp timestamp) {
      var format = DateFormat('yyyy-MM-dd'); // <- use skeleton here
      return format.format(timestamp.toDate()).toString();
    }



    // TODO: implement build

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Padding(
            padding: const EdgeInsets.only(left: 0.0, bottom: 10),
            child: Container(
              height: 120,
              decoration: const BoxDecoration(
                  borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(50)),
                  color: Color.fromARGB(255, 75, 57, 239)),
              child: Stack(
                children: [
                  Positioned(
                      top: 50,
                      left: 0,
                      child: Container(
                          height: 40,
                          width: 200,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50)),
                          ))),
                  const Positioned(
                      top: 55,
                      left: 35,
                      child: Text("Complaints",
                          style: TextStyle(
                              fontSize: 25,
                              color: Color(0xFF363f93),
                              fontWeight: FontWeight.bold)))
                ],
              ),
            ),
          )),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (BuildContext context, int index) {


              return GestureDetector(
                onTap: () {

                  setState(() {});

                  print("index");
                },
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: (Card(
                        elevation: 8,
                        shadowColor: Colors.indigo,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          width: 300,
                          height: 230,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          dataList[index]['Complaint_type'] +
                                              " Complaint ",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            "${"${"Posted by: " + dataList[index]['user_name']}"
                                                " (" + dataList[index]['user department']})"
                                                " on ${formatTimestamp(dataList[index]['Date'])}",
                                            style: const TextStyle(
                                                color: Colors.blueGrey,
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: SizedBox(
                                            width: 220,
                                            child: Text(
                                              dataList[index]
                                              ['Complaint_Tittle'],
                                              softWrap: true,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              maxLines: null,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: SizedBox(
                                            width: 220,
                                            child: Text(
                                              "Complaint Description: " +
                                                  dataList[index]
                                                  ['description'],
                                              softWrap: true,
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                              maxLines: null,
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FFButtonWidget(

                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Complaint status:"+dataList[index]['status']
                                                  ,style: TextStyle(color:((dataList[index]['status'])=="Pending")?Colors.red:(dataList[index]['status'])=="Complaint Approved"?Colors.yellow:Colors.green ),),
                                                content: Row(
                                                  children: [
                                                    Text(" As on "+ DateTime.now().toString().substring(0,11),style: TextStyle(fontWeight: FontWeight.bold),),

                                                  ],
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,

                                                ),

                                              );
                                            },
                                          );

                                          print('Button pressed ...');
                                          final snackbar =SnackBar(content: Text("You are viewing status of the Complaint!"),elevation: 20,backgroundColor: Colors.blue,
                                            action: SnackBarAction(textColor: Colors.white, label: '', onPressed: () {


                                            },),);
                                          ScaffoldMessenger.of(context).showSnackBar(snackbar);


                                        },
                                        text: 'View Status',
                                        options: FFButtonOptions(
                                          width: 90,
                                          height: 40,
                                          color: FlutterFlowTheme.of(context).primaryColor,
                                          textStyle:
                                          FlutterFlowTheme.of(context).subtitle2.override(
                                            fontFamily: 'Roboto',
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 15,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                    ),
                  ],
                ),
              );
            }),
      ),


    );
  }
}
