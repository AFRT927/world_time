import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



void setUpWorldTime() async {
 
    WorldTime wtExample = WorldTime(location: 'Berlin', flag: 'Berlin.jpeg', url: 'Europe/Berlin'); 
    await wtExample.getTime();
    print('${wtExample.location} time is: ${wtExample.time}');  

    // navigate to /home and pass data
    Navigator.pushReplacementNamed(context,
                                   '/home',
                                   arguments: {
                                    'location': wtExample.location,
                                    'flag': wtExample.flag,
                                    'time': wtExample.time,
                                    });


}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    setUpWorldTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(50),
       child: Text('loading'),),
                   
    );
  }
}