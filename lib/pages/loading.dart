import 'package:flutter/material.dart';
//import 'package:http/http.dart';
//The dart convert package helps us to convert data gotten from the http into a map so we can be able to use the data in it.
//import 'dart:convert';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  /*void getData() async {
    /*
    //Simulate network request for a username
    /*
    Future.delayed(Duration(seconds: 3), () {
      print('Fola');
    });*/
    String username = await Future.delayed(Duration(seconds: 3), () {
      return 'Fola';
    });

    //Simulate network request for user biography
    /*
    Future.delayed(Duration(seconds: 2), () {
      print('Loves football, music,reading');
    });*/
    String bio = await Future.delayed(Duration(seconds: 2), () {
      return ('Loves football, music,reading');
    });

    print('$username biography is $bio');
    */

    //The http package allows us to use the get function to get data from a link which will be stored in a function Response
    String url = 'https://jsonplaceholder.typicode.com/todos/1';
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    print(data);
    print(data['id']);
  }*/

  String time = 'loading';

  void getWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'London', flag: 'flag.png', url: 'Europe/London');
    await instance.getTime();
    /*setState(() {
      time = londonInstance.time;
    });*/

    // This load the new page by replacing the old page under it...
    // The arguments allows us to send or parse data from one page to another

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDaytime': instance.isDaytime,
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWorldTime();
    //print('IniState ran');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 300, 0, 0),
        child: Column(
          children: <Widget>[
            SpinKitThreeBounce(
              color: Colors.white,
              size: 50.0,
            ),
            SizedBox(
              height: 200,
            ),
            Text(
              'Loading...',
              style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 15,
                letterSpacing: 3.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
