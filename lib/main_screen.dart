import 'package:flutter/material.dart';
import 'home.dart';
import 'homeobat.dart';
//import 'package:firebase/login_page.dart'; 
class MainScreen extends StatelessWidget { 
    @override Widget build(BuildContext context) {
         return DefaultTabController(
        length: 2,
        child: Scaffold(
        appBar: AppBar(
             title: Text("Data Puskesmas"),
             bottom: TabBar(
               tabs: [
                Tab(
                  text: "BIODATA",
                ),
                Tab(
                  text: "OBAT",
                ), 
               ],
             ),
        ),
        body: TabBarView(
          children: [
            Home(),
            HomeImun(),
          ],
         ),
        )
      );
     }
     }