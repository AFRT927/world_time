import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

void getData() async {

   Response res = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
   Map data = jsonDecode( res.body );
   print(data);
   print('just user: ${data['userId']}');

}

void getTime() async {
  Response res = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Europe/London'));
  Map data =jsonDecode(res.body);
  //print('response is $data');

  //get properties from data  
  String dateTime = data['datetime'];
  int dst_offSet = data['dst_offset'];
  String utc_offSet = data['utc_offset'].toString().substring(1,3);
  print('utc_offSet is $utc_offSet');
  //create datetime object
  DateTime now = DateTime.parse(dateTime);
  print('now before: $now');
  now = now.add(Duration(hours: int.parse(utc_offSet)));
  print('now after: $now');
  
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();   
    //getData();    
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading screen ...'),      
    );
  }
}