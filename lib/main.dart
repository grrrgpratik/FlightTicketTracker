import 'package:flight_ticket_tracker/CustomShapeClipper.dart';
import 'package:flutter/material.dart';

void main() => runApp((MaterialApp(
    title: "Flight Tracker App",
    debugShowCheckedModeBanner: false,
    theme: appTheme,
    home: MyApp())));

Color firstColor = Color(0xFFF47D15);
Color secondColor = Color(0xFFEF772C);

ThemeData appTheme =
    ThemeData(primaryColor: Color(0xFFF3791A), fontFamily: "Oxygen");

List<String> locations = ["Boston (BOS)", "New York City(NYC)"];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[HomeScreenTopContainer()],
      ),
    );
  }
}

const dropDownLabelStyle = TextStyle(color: Colors.white, fontSize: 16);
const dropDownMenuItemStyle = TextStyle(color: Colors.black, fontSize: 18);

class HomeScreenTopContainer extends StatefulWidget {
  @override
  _HomeScreenTopContainerState createState() => _HomeScreenTopContainerState();
}

class _HomeScreenTopContainerState extends State<HomeScreenTopContainer> {
  var selectedLocationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secondColor])),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      PopupMenuButton(
                        child: Row(
                          children: <Widget>[
                            Text(
                              locations[selectedLocationIndex],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Icon(Icons.keyboard_arrow_down, color: Colors.white)
                          ],
                        ),
                        onSelected: (index) {
                          setState(() {
                            selectedLocationIndex = index;
                          });
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<int>>[
                          PopupMenuItem(
                            child: Text(locations[0],
                                style: dropDownMenuItemStyle),
                            value: 0,
                          ),
                          PopupMenuItem(
                            child: Text(locations[1],
                                style: dropDownMenuItemStyle),
                            value: 1,
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Where would\nyou want to go ?",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: TextField(
                      controller: TextEditingController(text: locations[1]),
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      cursorColor: appTheme.primaryColor,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 14),
                          suffixIcon: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          )),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
