import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



void setUpWorldTime(WorldTime wt) async {
 
    //WorldTime wt = WorldTime(location: 'Berlin', flag: 'Berlin.jpeg', url: 'Europe/Berlin'); 
    await wt.getTime();
    print('${wt.location} time is: ${wt.time}');  

    // navigate to /home and pass data
    Navigator.pushReplacementNamed(context,
                                   '/home',
                                   arguments: {
                                    'location': wt.location,
                                    'flag': wt.flag,
                                    'time': wt.time,
                                    'isDayTime': wt.isDayTime
                                    });


}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    Map data = ModalRoute.of(context)?.settings.arguments as Map;

    setUpWorldTime(data['city']);

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