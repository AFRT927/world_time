import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



void setUpWorldTime() async {
 
    WorldTime worldTimeInstance = WorldTime(location: 'Berlin', flag: 'Berlin.jpeg', url: 'Europe/Berlin'); 
    await worldTimeInstance.getTime();
    print('${worldTimeInstance.location} time is: ${worldTimeInstance.time}');  

    // navigate to /home and pass data
    Navigator.pushReplacementNamed(context,
                                   '/home',
                                   arguments: {
                                    'location': worldTimeInstance.location,
                                    'flag': worldTimeInstance.flag,
                                    'time': worldTimeInstance.time,
                                    'isDayTime': worldTimeInstance.isDayTime
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
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50,
        )
      )
                   
    );
  }
}