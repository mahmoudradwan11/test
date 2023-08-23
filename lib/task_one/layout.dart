import 'package:flutter/material.dart';
import 'package:test_trauxit/task_one/home.dart';
import 'package:test_trauxit/task_one/profile.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length:2, child:Scaffold(
      appBar: AppBar(
        title: const Text('trauxit'),
       centerTitle: true,
       bottom: const TabBar(tabs:[
         Tab(
           text: 'Home',
           icon: Icon(Icons.home),
         ),
         Tab(
           text: 'Profile',
           icon: Icon(Icons.person),
         ),
       ],),
     ),
      body:const TabBarView(
        children: [
          HomeScreen(),
          ProfileScreen(),
        ],
      ),
    )
    );

  }
}
