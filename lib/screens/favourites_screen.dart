import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/util/places.dart';
import 'package:flutter_travel_concept/widgets/horizontal_place_item.dart';
import 'package:flutter_travel_concept/widgets/icon_badge.dart';
import 'package:flutter_travel_concept/widgets/vertical_place_item.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
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
      body: buildVerticalList(),
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
