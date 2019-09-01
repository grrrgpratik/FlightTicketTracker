import 'package:flight_ticket_tracker/CustomShapeClipper.dart';
import 'package:flight_ticket_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Color firstColor = Color(0xFFF06E2A);
Color secondColor = Color(0xFFF27423);
final Color discountBackgroundColor = Color(0xFFFFE08D);
final Color flightBorderColor = Color(0xFFE6E6E6);
final Color chipBackgroundColor = Color(0xFFF6F6F6);

final formatCurrency = NumberFormat.simpleCurrency();

class FlightListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Search Result"),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: InkWell(
              customBorder: new CircleBorder(),
              child: Icon(Icons.arrow_back),
              onTap: () {
                Navigator.pop(context);
              }),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FlighListTopPart(),
            SizedBox(
              height: 20,
            ),
            FlightListBottomPart()
          ],
        ),
      ),
    );
  }
}

class FlighListTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [firstColor, secondColor])),
            )),
        Column(
          children: <Widget>[
            SizedBox(
              height: 45.0,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              elevation: 10,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Boston (BOS)",
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Text(
                                "New York City (NYC)",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.import_export,
                            color: Colors.black,
                            size: 32,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

const dropDownMenuItemStyle = TextStyle(color: Colors.black, fontSize: 18);

class FlightListBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Best Deals for Next 6 Months",
              style: dropDownMenuItemStyle,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListView(
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
              FlightCard(),
              FlightCard(),
              FlightCard(),
              FlightCard(),
              FlightCard(),
              FlightCard(),
            ],
          )
        ],
      ),
    );
  }
}

class FlightCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border.all(color: flightBorderColor)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      '${formatCurrency.format(4259)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    Text(
                      '${formatCurrency.format(9999)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey),
                    )
                  ],
                ),
                Wrap(
                  spacing: 12.0,
                  runSpacing: -8.0,
                  children: <Widget>[
                    FlightDetailChip(Icons.calendar_today, "June 2019"),
                    FlightDetailChip(Icons.flight_takeoff, "Jet Airways"),
                    FlightDetailChip(Icons.star, "4.4"),
                    FlightDetailChip(Icons.star, "4.4"),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              "55%",
              style: TextStyle(color: appTheme.primaryColor, fontSize: 14),
            ),
            decoration: BoxDecoration(
                color: discountBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
          ),
        )
      ]),
    );
  }
}

class FlightDetailChip extends StatelessWidget {
  final IconData iconData;
  final String label;

  FlightDetailChip(this.iconData, this.label);

  @override
  Widget build(BuildContext context) {
    return RawChip(
      label: Text(label),
      labelStyle: TextStyle(color: Colors.black, fontSize: 14),
      backgroundColor: chipBackgroundColor,
      avatar: Icon(
        iconData,
        size: 14.0,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    );
  }
}
