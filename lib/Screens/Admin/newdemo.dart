import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late List<Map<String, dynamic>> dataList;

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
    print(dataList[1]);
    return dataList;

  }



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(dataList[index]['Complaint_Tittle']),
                subtitle: Text(dataList[index]['Complaint_type']),
              );
            },
          ),
        ),
      ),
    );
  }
}
