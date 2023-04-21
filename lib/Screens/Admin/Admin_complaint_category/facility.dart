import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:icomplaint/Screens/complaint%20categories/facility_complaints.dart';
import  'package:icomplaint/Screens/flutterflow/flutterflowWidgets.dart';
import 'package:icomplaint/Screens/flutterflow/flutterflowTheme.dart';

class CarouselPage extends StatefulWidget {
  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  int _currentIndex = 0;
  final List<String> _carouselItems = ['Facility related complaints include the complaints of the student on the basic needs they get in their college campus.'];

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
                          width: 280,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50)),
                          ))),
                  const Positioned(
                      top: 55,
                      left: 20,
                      child: Text(" Facility Related Complaints",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF363f93),
                              fontWeight: FontWeight.bold)))
                ],
              ),
            ),
          )),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/college_facilities.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 80,width: 220,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                 "",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 16,width: 200,),
              Expanded(
                child: CarouselSlider(
                  items: _carouselItems.map((item) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item,
                            style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,
                               ),
                          ),
                          SizedBox(height:10),
                          FFButtonWidget(

                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>facility_complaint(),
                              ));

                              print('Button pressed ...');
                              final snackbar =SnackBar(content: Text("You are viewing all Facility Related Complaints!"),elevation: 20,backgroundColor: Colors.blue,
                                action: SnackBarAction(textColor: Colors.white, label: '', onPressed: () {   Navigator.push(context,MaterialPageRoute(builder: (context)=>facility_complaint(),
                                ));

                                },),);
                              ScaffoldMessenger.of(context).showSnackBar(snackbar);


                            },
                            text: 'View All Facility Related Complaints',
                            options: FFButtonOptions(
                              width: 220,
                              height: 40,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 9.0,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 400,



                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _carouselItems.map((item) {
                  int index = _carouselItems.indexOf(item);
                  return Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Colors.blueAccent
                          : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }
}
