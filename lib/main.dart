import 'package:flight_ticket_tracker/CustomShapeClipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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

final formatCurrency = NumberFormat.simpleCurrency();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFFC86712)));
    return Scaffold(
      body: Column(
        children: <Widget>[HomeScreenTopContainer(), homeScreenBottomContainer],
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
  var isFlightSelected = true;

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
                  "Where would you\nlike to go ?",
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
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          isFlightSelected = true;
                        });
                      },
                      child: ChoiceChip(
                          Icons.flight_takeoff, "Flights", isFlightSelected),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                        onTap: () {
                          setState(() {
                            isFlightSelected = false;
                          });
                        },
                        child: ChoiceChip(
                            Icons.hotel, "Hotels", !isFlightSelected)),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;

  ChoiceChip(this.icon, this.text, this.isSelected);
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.all(Radius.circular((20.0))))
          : null,
      child: Row(children: <Widget>[
        Icon(
          widget.icon,
          size: 20,
          color: Colors.white,
        ),
        SizedBox(width: 8),
        Text(
          widget.text,
          style: TextStyle(color: Colors.white, fontSize: 16),
        )
      ]),
    );
  }
}

var viewAllStyle = TextStyle(fontSize: 14.0, color: appTheme.primaryColor);

var homeScreenBottomContainer = Container(
    child: Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: 16.0,
          ),
          Text(
            "Currently Watched Items",
            style: dropDownMenuItemStyle,
          ),
          Spacer(),
          Text(
            "View All(12)",
            style: viewAllStyle,
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 260.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: cityCard,
        ),
      ),
    )
  ],
));

List<CityCard> cityCard = [
  CityCard("assets/images/lasvegas.jpg", "Las Vegas", "Feb 2019", "45", "4299",
      "2250"),
  CityCard(
      "assets/images/athens.jpg", "Athens", "Apr 2019", "50", "9999", "4150"),
  CityCard(
      "assets/images/sydney.jpeg", "Sydney", "Dec 2018", "40", "5999", "2399"),
];

class CityCard extends StatelessWidget {
  final String imagePath, cityName, monthYear, discount, oldPrice, newPrice;

  CityCard(this.imagePath, this.cityName, this.monthYear, this.discount,
      this.oldPrice, this.newPrice);

  @override
  Widget build(BuildContext context) {
    debugPrint(imagePath);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                    height: 210,
                    width: 160,
                    child: Image.asset(
                      '$imagePath',
                      fit: BoxFit.cover,
                    )),
                Positioned(
                  left: 0,
                  bottom: 0,
                  height: 60,
                  width: 160,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          Colors.black,
                          Colors.black.withOpacity(0.1)
                        ])),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(cityName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18)),
                          Text(monthYear,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontSize: 14)),
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Text("$discount%",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 14)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 5,
              ),
              Text(
                '${formatCurrency.format(double.parse(newPrice))}',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '(${formatCurrency.format(double.parse(oldPrice))})',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
