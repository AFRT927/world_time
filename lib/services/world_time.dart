import 'package:http/http.dart';
import 'dart:convert';



class WorldTime {

  String location; // location in the UI
  String? time; // the time in that location
  String? flag; // url to an asset flag icon
  String url; // location url for api endpoints

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

  try {
      // query data  
      Response res = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));//'http://worldtimeapi.org/api/timezone/Europe/London'
      Map data =jsonDecode(res.body);  

      // get properties from data  
      String dateTime = data['datetime']; 
      String utc_offSet = data['utc_offset'].toString().substring(1,3);
      
      // create datetime object
      DateTime now = DateTime.parse(dateTime); 
      now = now.add(Duration(hours: int.parse(utc_offSet)));
      
      // set the variable
      time = now.toString();
      print('now is $now and time is $time'); 
    
  } catch (e) {
    print('caught error: $e');
    time = 'could not get time data';
  }
 


  }

}