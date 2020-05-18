import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animations/animations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage());
  }
}

class CardDetails {
  final String title;
  final String subTitle;
  final String image;

  CardDetails(this.title, this.subTitle, this.image);
}

class SecondRoute extends StatelessWidget {
  final CardDetails details;

  const SecondRoute({Key key, this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        backgroundColor: Color(0xFFD19BEC),
        bottomNavigationBar: BottomAppBar(
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonTheme(
                minWidth: 300.0,
                child: RaisedButton(
                  child: Text("Start the programme",
                      style: TextStyle(color: Colors.white)),
                  color: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(children: [
          Column(
            children: <Widget>[
              Container(
                height: 150,
                color: Color(0xFFD19BEC),
                child: Hero(
                  tag: details.image,
                  child: Center(
                    child: SvgPicture.asset(details.image,
                        width: MediaQuery.of(context).size.width / 3.0,
                        height: 200),
                  ),
                ),
              ),
              Container(
                height: 150,
                color: Color(0xFFD19BEC),
              ),
              Expanded(
                child: Container(
                  color: Color(0xFFF7F7F8),
                ),
              ),
            ],
          ),
          ListView(children: [
            SizedBox(
              height: 175,
            ),
            Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    side: BorderSide.none),
                elevation: 4.0,
                margin: EdgeInsets.all(15),
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(details.title,
                        style: TextStyle(
                            fontFamily: "arial",
                            fontSize: 14,
                            color: Colors.black87)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(details.subTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "times",
                            fontSize: 40,
                            fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 20, right: 20, bottom: 8),
                    child: Text(
                        "In this 7-day programme, we'll help you to write your thoughts down, identify any negative thinking and...",
                        style: TextStyle(
                            fontFamily: "arial",
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      "Keep reading >",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )),
                  )
                ])),
            DayWidget(title: "Day 1"),
            DayWidget(title: "Day 2"),
            DayWidget(title: "Day 3"),
          ]),
        ]));
  }
}

class DayWidget extends StatelessWidget {
  final title;
  const DayWidget({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFF3F3F5),
      child: ListTile(
        title: Text(title),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Color(0xFFFECE6D),
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 40, top: 20),
            child: IconButton(
              icon: FaIcon(
                FontAwesomeIcons.user,
                size: 20,
              ),
              color: Colors.black87,
              onPressed: () {
                // do something
              },
            ),
          )
        ],
        backgroundColor: Colors.transparent,
//        backgroundColor: Color(0x44000000),
        elevation: 0,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
          child: Text("evermind",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                  fontFamily: "times",
                  fontWeight: FontWeight.w600)),
        ),
      ),
      body: Stack(children: [
        SvgPicture.asset(
          "assets/undraw_blooming_jtv6.svg",
          height: 450,
        ),
        ListView(
          children: <Widget>[
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: FaIcon(FontAwesomeIcons.playCircle, size: 96),
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 5,
              margin: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Text("Recommended progammes",
                          style: TextStyle(fontFamily: "times", fontSize: 18)),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ProgramCard(
                                title: "7 day programme",
                                subTitle: "Working with thoughts",
                                image:
                                    "assets/undraw_creative_thinking_b3bc.svg",
                                backgroundColor: Color(0xFFD19BEC)),
                            ProgramCard(
                                title: "4 day programme",
                                subTitle: "4 days of gratitude",
                                image: "assets/undraw_Appreciation_sjc1.svg",
                                backgroundColor: Color(0xFF8CD9E5)),
                          ],
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.black87,
          backgroundColor: Colors.white,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.home,
                size: 15,
              ),
              title: Text('Home',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500)),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.bookOpen, size: 15),
              title: Text('Library',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500)),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.flag, size: 15),
              title: Text('My journey',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500)),
            ),
          ]),
    );
  }
}

class ProgramCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final Color backgroundColor;

  const ProgramCard(
      {Key key, this.title, this.subTitle, this.image, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SecondRoute(
                    details: CardDetails(title, subTitle, image),
                  )),
        );
      },
      child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              side: BorderSide.none),
          elevation: 4.0,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width / 2.5,
                      color: backgroundColor),
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Hero(
                        tag: image,
                        child: SvgPicture.asset(image,
                            width: MediaQuery.of(context).size.width / 3.0,
                            height: 90),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(title,
                    style: TextStyle(
                        fontFamily: "arial",
                        fontSize: 12,
                        color: Colors.black54)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
                child: Container(
                  width: 120,
                  child: Text(subTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "times",
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                ),
              ),
              Row(
                children: <Widget>[],
              )
            ],
          )),
    );
  }
}
