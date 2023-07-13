

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url:'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url:'Europe/Berlin', location: 'Germani', flag: 'germany.png'),
    WorldTime(url:'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url:'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url:'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url:'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url:'Asia/Seul', location: 'Seul', flag: 'south_korea.png'),
    WorldTime(url:'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {                  
                  Navigator.pushReplacementNamed(context, '/loading', arguments:{'city': locations[i]});
                },
                title: Text(locations[i].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[i].flag}'),
                ),              
              ),
            ),
          );
        }
        )
    );
  }
}