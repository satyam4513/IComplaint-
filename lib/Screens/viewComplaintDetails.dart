

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MultiDetailCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String detail1;
  final String detail2;
  final String detail3;

  const MultiDetailCard({
    required this.title,
    required this.subtitle,
    required this.detail1,
    required this.detail2,
    required this.detail3,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      height: 300,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 8),
              Text(
                subtitle,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
                maxLines: null,
              ),
              SizedBox(height: 24),
              Text(
                'Posted on: $detail1',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Posted by: $detail2',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Complaint Status: $detail3',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class view_details extends StatefulWidget {
  const view_details(int index, {Key? key,}) : super(key: key);
  @override
  view_detailsState createState() => view_detailsState();
}

class view_detailsState extends State<view_details> {
  CollectionReference Complaint_data =
      FirebaseFirestore.instance.collection('Complaint_data1');
  late Stream<QuerySnapshot> Complaint_stream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Complaint_stream = Complaint_data.snapshots();
  }

  @override
  Widget build(BuildContext context) {

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
                            width: 250,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  bottomRight: Radius.circular(50)),
                            ))),
                    const Positioned(
                        top: 55,
                        left: 35,
                        child: Text("Complaint Details",
                            style: TextStyle(
                                fontSize: 25,
                                color: Color(0xFF363f93),
                                fontWeight: FontWeight.bold)))
                  ],
                ),
              ),
            )),
      body: StreamBuilder<QuerySnapshot>(
          stream: Complaint_stream,
          builder: (BuildContext context,AsyncSnapshot snapshot){


            if(snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }


            if(snapshot.connectionState==ConnectionState.active)
            {
              QuerySnapshot querySnapshot= snapshot.data;
              List<QueryDocumentSnapshot> listQueryDocumentSnapshot=querySnapshot.docs;

             QueryDocumentSnapshot document=listQueryDocumentSnapshot[7];

              return MultiDetailCard(
                title:document['Complaint_Tittle'],
                subtitle: document['status'],
                detail1: 'det1',
                detail2: 'det2',
                detail3: 'det3',);



            }

            return const Center(child: CircularProgressIndicator());
          }

          ),



    );
  }
}
