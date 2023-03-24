import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    //DATA From Loding Page
   data = data.isEmpty?ModalRoute.of(context)!.settings.arguments as Map:data;
    {
      // 'time':timeNow,
      // 'location':timeZone,

    }
    String beimg = data['isDayTime'] ? 'day.png' : 'night.png';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/$beimg"), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  print(result);
                  setState(() {
                    if (result==null) {
                          data = {
                      'time': '',
                      'location': 'Pleaes Choose location ^.^',
                      'isDayTime': false,
                    };
                      
                    } else {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDayTime': result['isDayTime'],
                    };
                      
                    }


                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Color.fromARGB(255, 255, 129, 129),
                  size: 24.0,
                ),
                label: Text(
                  "Edit location",
                  style: TextStyle(fontSize: 19),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(146, 90, 104, 223)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(22)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Container(
                width: double.infinity,
                color: Colors.black26,
                child: Column(
                  children: [
                    Text(
                      data['time'],
                      style: TextStyle(color: Colors.black, fontSize: 40),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(data['location'],
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
