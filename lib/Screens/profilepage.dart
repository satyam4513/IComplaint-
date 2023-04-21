import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icomplaint/Screens/mycomplaints.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'user_detaills/detail_update.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);


  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String uid=FirebaseAuth.instance.currentUser!.uid;
  String value = 'hello';
  final _picker = ImagePicker();
   File _imageFile=File('');
   String _imagePath='';

  @override
  void initState() {
    super.initState();
    getDataByUid(uid).then((value) {
      setState(() {
        dataList = value;
      });
    });
  }








 // late List<Map<String, dynamic>> dataList=[];
  List<DocumentSnapshot> dataList = [];


  Future<List<DocumentSnapshot>> getDataByUid(String uid) async {
    List<DocumentSnapshot> dataList = [];

    await FirebaseFirestore.instance
        .collection('userId')
        .where('uid', isEqualTo: uid)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        dataList.add(doc);
      });
    });

    return dataList;

  }





  // Create a function to copy the selected image to local storage
  Future<void> _saveImage() async {
    // Get the app's local directory using the path_provider package
    final directory = await getApplicationDocumentsDirectory();

    // Generate a unique filename for the image
    final filename = 'profile_pic_${DateTime.now().millisecondsSinceEpoch}.jpg';

    // Combine the directory path and filename to create the full path of the image
    final path = '${directory.path}/$filename';

    // Copy the selected image to the local directory
    final imageFile = await _imageFile.copy(path);

    // Update the _imagePath variable with the path of the saved image
    _imagePath = imageFile.path;
  }


  // Create a function to pick an image from camera or gallery
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      await _saveImage();
    }
  }
  @override
  Widget build(BuildContext context) {




    return Scaffold(
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
                        child: Text("User Profile",
                            style: TextStyle(
                                fontSize: 25,
                                color: Color(0xFF363f93),
                                fontWeight: FontWeight.bold)))
                  ],
                ),
              ),
            )),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {


            return GestureDetector(
              onTap: () {

                setState(() {});


              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: 200.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Center(
                      child: Stack(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 60.0,
                            backgroundImage:
                            _imageFile != null ? FileImage(_imageFile) : null,
                          ),

                          Positioned(
                            bottom: 0.0,
                            right: 0.0,
                            child: FloatingActionButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SafeArea(
                                      child: Container(
                                        child: Wrap(
                                          children: <Widget>[
                                            ListTile(
                                              leading: const Icon(Icons.camera),
                                              title: const Text('Take a photo'),
                                              onTap: () {
                                                _pickImage(ImageSource.camera);
                                                Navigator.pop(context);
                                              },
                                            ),
                                            ListTile(
                                              leading: const Icon(Icons.image),
                                              title: const Text('Choose from gallery'),
                                              onTap: () {
                                                _pickImage(ImageSource.gallery);
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: const Icon(Icons.camera_alt),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Center(
                      child: Text(dataList[0]['user_name'].toString(),
                        style: const TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Center(
                    child: Text("(${dataList[0]['user_department']})",
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )

                  ,ListTile(
                    title: const Text('Update User Details'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      final TextEditingController _userNameController = TextEditingController();
                      final TextEditingController _userDepartmentController = TextEditingController();
                      final TextEditingController _classController = TextEditingController();
                      setState(() {

                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.person),
                                      SizedBox(width: 16.0),
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'User Name',
                                          ),
                                          controller: _userNameController,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.0),
                                  Row(
                                    children:  [
                                      Icon(Icons.business),
                                      SizedBox(width: 16.0),
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'User Department',

                                          ),


                                          controller: _userDepartmentController,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.0),
                                  Row(
                                    children: [
                                      Icon(Icons.school),
                                      SizedBox(width: 16.0),
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Class',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.0),
                                  ElevatedButton(
                                    onPressed: () {

                                      final TextEditingController _classController = TextEditingController();
                                      // Add save logic here

                                      CollectionReference colref =
                                      FirebaseFirestore.instance.collection('userId');
                                      try {
                                        colref.doc(FirebaseAuth.instance.currentUser!.uid
                                            )
                                            .update({
                                          'uid':FirebaseAuth.instance.currentUser!.uid,
                                          'user_name': _userNameController.text,
                                          'user_department':_userDepartmentController.text,

                                        });
                                        print(
                                            'Field updated successfully');
                                      } catch (e) {
                                        print(
                                            'Error updating field: $e');
                                      }

                                      Navigator.of(context).pop();

                                    },
                                    child: Text('Save'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      });


                    }
            ,
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('Complaint History'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder:
                          (context)=>const my_complaints()),);
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('Academic Details'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                ],
              ),
            );
          }),
    );
  }
}
