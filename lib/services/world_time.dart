import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //Name of the location
  String url; //The location link
  late String time;
  String flag; //The location flag as an image
  late bool isDaytime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      String link = 'https://worldtimeapi.org/api/timezone/$url';

      //Making the response
      Response responses = await get(Uri.parse(link));

      Map datas = jsonDecode(responses.body);
      //print(datas);

      //getting the data
      String datetime = datas['datetime'];
      String offset = datas['utc_offset'].substring(1, 3);

      //print(offset);
      //print(datetime);

      //Creating Date Time Object

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //print(now);

      //Setting the time property by converting it into a string
      //time = now.toString();
      isDaytime = now.hour > 6 && now.hour < 19
          ? true
          : false; //This is a ternary operator...
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('This is the error$e');
      time = 'Couldnt load the location';
    }
  }
}
