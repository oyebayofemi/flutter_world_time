import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'london.jpg'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.jpg'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.jpg'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.jpg'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.jpg'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.jpg'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instances2 = locations[index];
    await instances2.getTime();

    Navigator.pop(context, {
      'location': instances2.location,
      'flag': instances2.flag,
      'isDaytime': instances2.isDaytime,
      'time': instances2.time,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Build ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue[800],
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('lib/assets/flags/${locations[index].flag}'),
                ),
              ),
            );
          }),
    );
  }
}
