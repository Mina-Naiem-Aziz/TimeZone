import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'getDateclas.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getDatalodingpage() async {
    AllCountries oneCountry = AllCountries(countryName:'Egypt',flag: 'egypt',link: 'Africa/Cairo');
   await oneCountry.getData();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time': oneCountry.timeNow,
      'location': oneCountry.timeZone,
      'isDayTime': oneCountry.isDayTime,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDatalodingpage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitThreeInOut(
              color: Color.fromARGB(255, 165, 143, 179),
              size: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
