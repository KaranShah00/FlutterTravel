import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/util/places.dart';
import 'package:flutter_travel_concept/widgets/horizontal_place_item.dart';
import 'package:flutter_travel_concept/widgets/icon_badge.dart';
import 'package:flutter_travel_concept/widgets/vertical_place_item.dart';

class ShoppingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping'),
        actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.airplanemode_on),
                  SizedBox(width: 4,),
                  Text('ETA: 2 hours')
                ],
              ),
            ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Mumbai Airport",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildHorizontalList(context),
          buildVerticalList(),
        ],
      ),
    );
  }

  buildHorizontalList(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      height: 150.0,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: categories == null ? 0.0 : categories.length,
        itemBuilder: (BuildContext context, int index) {
          Map category = categories.toList()[index];
          return HorizontalPlaceItem(place: category);
        },
      ),
    );
  }

  buildVerticalList() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: ListView.builder(
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: shopping_places == null ? 0 : shopping_places.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = shopping_places[index];
          return VerticalPlaceItem(place: place);
        },
      ),
    );
  }
}
