import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/util/places.dart';
import 'package:flutter_travel_concept/widgets/icon_badge.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import './map_screen.dart';

class Details extends StatelessWidget {
  final Map place;
  Details(this.place);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place["name"]),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
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
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.only(left: 20),
            height: 250.0,
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  place["img"],
                  height: 250.0,
                  width: MediaQuery.of(context).size.width - 40.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  place["category"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(
                thickness: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      place["name"],
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite_border_outlined,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: 14,
                    color: Colors.blueGrey[300],
                  ),
                  SizedBox(width: 3),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${place["location"]} | 1.5 km away",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.blueGrey[300],
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              RatingBar.builder(
                itemSize: 20,
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  size: 5,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Description",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  place["details"],
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_pin),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (b) => MapScreen()));
        },
      ),
    );
  }

  // buildSlider() {
  //   return Container(
  //     padding: EdgeInsets.only(left: 20),
  //     height: 250.0,
  //     child: ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       primary: false,
  //       itemCount: places == null ? 0 : places.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         Map place = places[index];

  //         return Padding(
  //           padding: EdgeInsets.only(right: 10.0),
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(10.0),
  //             child: Image.asset(
  //               "${place["img"]}",
  //               height: 250.0,
  //               width: MediaQuery.of(context).size.width - 40.0,
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
}
