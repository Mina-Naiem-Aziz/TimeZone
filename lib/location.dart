import 'package:flutter/material.dart';

import 'getDateclas.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List allCountries = [
    AllCountries(
        link: 'Africa/Cairo', countryName: 'Egypt - Cairo', flag: 'egypt.png'),
    AllCountries(
        link: 'Africa/Tunis',
        countryName: 'Tunisia - Tunis',
        flag: 'tunisia.png'),
    AllCountries(
        link: 'Africa/Algiers',
        countryName: 'Algeria - Algiers',
        flag: 'algeria.png'),
    AllCountries(
        link: 'Australia/Sydney',
        countryName: 'Australia - Sydney',
        flag: 'australia.png'),
    AllCountries(
        link: 'America/Toronto',
        countryName: 'Canada - Toronto',
        flag: 'canada.png'),
    AllCountries(
        link: 'Asia/Riyadh',
        countryName: '	Saudi Arabia - Riyadh',
        flag: 'sa.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
       // automaticallyImplyLeading: false,
        title: Text('Location'),
      ),
      body: SizedBox(
        child: ListView.builder(
            padding: EdgeInsets.all(9),
            itemCount: allCountries.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  onTap: () async {
                    AllCountries clickedCountry = allCountries[index];

                    await clickedCountry.getData();
                    Navigator.pop(context, {
                      'time': clickedCountry.timeNow,
                      'location': clickedCountry.timeZone,
                      'isDayTime': clickedCountry.isDayTime
                    });
                  },
                  title: Text(
                    allCountries[index].countryName,
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/${allCountries[index].flag}"),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
