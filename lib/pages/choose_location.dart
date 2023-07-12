import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

int counter = 0;

void getData() async {

 // simulate network request for a username
 String userName = await Future.delayed(Duration(seconds: 3), (){
  return 'yoshi';
 });

  // simulate network request to get biography of the username
 String bio = await Future.delayed(Duration(seconds: 2), (){
  return 'vegan, musician & egg colector';
 });

 print('$userName - $bio');

}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState function ran');
    getData();
    print('hey there!');
  }

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
      body: ElevatedButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Text('counter is $counter'),
      ),
    );
  }
}