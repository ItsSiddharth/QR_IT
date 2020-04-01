import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:qrscan/qrscan.dart' as scanner;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String barcode;
  String medicine ='';
  String data = '';
  String monday = '';


  @override
  void initState(){
    super.initState();
    initializeApp();
  }
  void initializeApp() async{
    http.Response response =await http.get('http://192.168.43.129:5000/get_data/animisha/monday');
    data = response.body;

//    medicine = data['medicine_name'];
  }
  int no_of_medicines(String example){
    Map<String, dynamic> user = jsonDecode(data);
    return user["1"]['number_of_medicines'];
  }
  List Medcines(String example){
    List medicines = [];
    Map<String, dynamic> user = jsonDecode(data);
    for (var i =0; i<user["1"]['number_of_medicines'];i++ ){
      medicines.add(user["1"]["medicine_name"]["$i"]);
    }
    return medicines;
  }
  List Timings(String example){
    List timings = [];
    Map<String, dynamic> user = jsonDecode(data);
    for (var i =0; i<user["1"]['number_of_medicines'];i++ ){
      timings.add(user["1"]["timing"]["$i"]);
    }
    return timings;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pinkAccent,
            bottom: TabBar(
              isScrollable: true,
              tabs: <Widget>[
                Tab(text: 'M'),
                Tab(text: 'T'),
                Tab(text: 'W'),
                Tab(text: 'T'),
                Tab(text: 'F'),
                Tab(text: 'S'),
                Tab(text: 'S'),
              ],
            ),
            title: Text('QR-IT'),
          ),
          body: TabBarView(
            children: <Widget>[
              ListView.builder(
//                  itemCount: no_of_medicines(monday),
              itemCount: no_of_medicines('data') ,
                  itemBuilder: (context, index){
                    return Capsule(Medcines('data')[index], Timings('data')[index]);
                  }),
              ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index){
                    return Capsule('Sucrolose', 'Test1');
                  }),
              ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index){
                    return Capsule('Sucrolose', 'Test2');
                  }),
              ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index){
                    return Capsule('Sucrolose', 'Test3');
                  }),
              ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index){
                    return Capsule('Sucrolose', 'Test4');
                  }),
              ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index){
                    return Capsule('Sucrolose', 'Test5');
                  }),
              ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index){
                    return Capsule('Sucrolose', 'Test6');
                  }),
            ],
          ),
          backgroundColor: Color(0xFF4b4b4b),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[Colors.pinkAccent, Colors.pink],
                      )),
                  child: Center(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Patient Name',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              'Patient ID',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                CustomTile(Icons.add, 'Scan', () => {}),
                CustomTile(Icons.local_hospital, 'Database', () => {}),
                CustomTile(Icons.account_circle, 'Profile', () => {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class CustomTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black))),
        child: InkWell(
          splashColor: Colors.grey[100],
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(icon),
                  ),
                  Text('$text',
                      style: TextStyle(
                        fontSize: 18,
                      )),
                ],
              ),
              Icon(Icons.arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}

class Capsule extends StatelessWidget {

  String MedName;
  String Time;

  Capsule(this.MedName, this.Time);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              height: 120,
              margin: EdgeInsets.only(left: 2.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0))),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        '$MedName',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10, bottom: 10),
                      child: Text(
                        '$Time',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                  ),
                  new CircularPercentIndicator(
                    radius: 90,
                    animation: true,
                    animationDuration: 1200,
                    lineWidth: 15.0,
                    percent: 0.4,
                    center: new Text(
                      "Remaining",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


