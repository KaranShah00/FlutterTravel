import 'package:flutter/material.dart';

import '../screens/details.dart';
import '../screens/entertainment_screen.dart';
import '../screens/food_screen.dart';
import '../screens/shopping_screen.dart';
import '../screens/tourism_screen.dart';


class HorizontalPlaceItem extends StatelessWidget {
  final Map place;

  HorizontalPlaceItem({this.place});

  @override
  Widget build(BuildContext context) {
    //debugPrint(place["image"]);
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: InkWell(
        child: Container(
          height: 150.0,
          width: 140.0,
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(place["image"], height: 100, width: 150, fit: BoxFit.fitHeight,),
              ),
              SizedBox(height: 7.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${place["name"]}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                if(place["name"] == "Shopping") {
                  return ShoppingScreen();
                }
                else if(place["name"] == "Tourism") {
                  return TourismScreen();
                }
                else if(place["name"] == "Food") {
                  return FoodScreen();
                }
                else {
                  return EntertainmentScreen();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
