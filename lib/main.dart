import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:qrscan/qrscan.dart' as scanner;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  String barcode;
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
                  itemCount: 7,
                  itemBuilder: (context, index){
                    return Capsule('Sucrolose', TimeOfDay.now());
                  }),
              ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index){
                    return Capsule('Sucrolose', TimeOfDay.now());
                  }),
              ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index){
                    return Capsule('Sucrolose', TimeOfDay.now());
                  }),
              ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index){
                    return Capsule('Sucrolose', TimeOfDay.now());
                  }),
              ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index){
                    return Capsule('Sucrolose', TimeOfDay.now());
                  }),
              ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index){
                    return Capsule('Sucrolose', TimeOfDay.now());
                  }),
              ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index){
                    return Capsule('Sucrolose', TimeOfDay.now());
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
  TimeOfDay Time;

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


