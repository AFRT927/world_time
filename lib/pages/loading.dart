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

@override
  void initState() {
    // TODO: implement initState
    super.initState();   
    getData();    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading screen ...'),      
    );
  }
}