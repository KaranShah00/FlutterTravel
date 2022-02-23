import 'package:flutter/material.dart';

import './main_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key}) : super(key: key);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<String> _airlines = [
    'Indigo Airlines',
    'Jet Airways',
    'Emirates',
    'Etihad'
  ];
  String _selectedAirline;
  List<String> _airports = [
    'Mumbai Airport',
    'Newark Airport',
    'Delhi Airport',
    'Dubai Airport'
  ];
  String _selectedAirport;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PassMyTime'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("https://www.pngitem.com/pimgs/m/94-949900_flight-airplane-logo-png-transparent-png.png", height: 150,),
            SizedBox(height: 20,),
            DropdownButton(
              hint: Text(
                  'Please choose your airlines'), // Not necessary for Option 1
              value: _selectedAirline,
              onChanged: (newValue) {
                setState(() {
                  _selectedAirline = newValue;
                });
              },
              items: _airlines.map((airlines) {
                return DropdownMenuItem(
                  child: new Text(airlines),
                  value: airlines,
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: TextField(
                textCapitalization: TextCapitalization.characters,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your flight number',
                ),
              ),
            ),
            DropdownButton(
              hint: Text(
                  'Please choose the airport'), // Not necessary for Option 1
              value: _selectedAirport,
              onChanged: (newValue) {
                setState(() {
                  _selectedAirport = newValue;
                });
              },
              items: _airports.map((airports) {
                return DropdownMenuItem(
                  child: new Text(airports),
                  value: airports,
                );
              }).toList(),
            ),
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (b) => MainScreen()),),
                child: Text('Next'))
          ],
        ),
      ),
    );
  }
}
