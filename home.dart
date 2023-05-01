import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project/colors.dart';
import './SideMenuBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: true,
      key: _drawerKey,
      drawer: SideMenu(), //to give side menubar opened when clicking on menu
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 3)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        //here row wrapped in row widget
                        children: [
                          IconButton(
                              onPressed: () {
                                _drawerKey.currentState!.openDrawer();
                              },
                              icon: Icon(
                                Icons.menu,
                                color: white,
                              )),
                          SizedBox(
                            //sizedbox to shift "search your notes" from icon to right
                            width: 15,
                          ),
                          Container(
                              height: 55,
                              width: 200,
                              // decoration: BoxDecoration(
                              //     border: Border.all(color: Colors.white)),
                              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                              child: Text(
                                "Search Your Notes",
                                style: TextStyle(
                                    color: white.withOpacity(0.5),
                                    fontSize: 20),
                              )),

                          TextButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.grid_view, //grid_view to change icon
                                color: white,
                              )),
                          SizedBox(
                            //sizedbox to shift "search your notes" from icon to right
                            width: 9,
                          ),
                          // coz ciravatar screen ke bahar jaara tha
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 16,
                          )
                          //from IconButton to pink ) dont use in lab 2 coz its icon
                        ],
                      ),
                    ],
                  )),

              //for the notes part..pinned n all wala..
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Text(
                  "ALL",
                  style: TextStyle(
                      color: white.withOpacity(0.5),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.76,
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(22),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(112, 97, 97, 97),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Text(
                        "Dates of IA 1 from 15 Feb to 20 Feb",
                        style: TextStyle(
                          fontSize: 18,
                          color: white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(2),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(112, 97, 97, 97),
                      ),
                      child: const Text(
                        'Flutter submission date: 3rd March, Certification date: 6th March',
                        style: TextStyle(
                          fontSize: 18,
                          color: white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(2),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(112, 97, 97, 97),
                      ),
                      child: const Text(
                        'Outdoor Sphurti VESIT has various games like kho-kho, kabaddi, volleyball, badminton, throw ball.',
                        style: TextStyle(
                          fontSize: 18,
                          color: white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(2),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(112, 97, 97, 97),
                      ),
                      child: const Text(
                        'WT Health Monitoring System components gathering',
                        style: TextStyle(
                          fontSize: 18,
                          color: white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(2),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(112, 97, 97, 97),
                      ),
                      child: const Text(
                        'Flutter 4th and 5th submission in next week.',
                        style: TextStyle(
                          fontSize: 18,
                          color: white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(2),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(112, 97, 97, 97),
                      ),
                      child: const Text(
                        'Sem 5 result decaration after comps result.',
                        style: TextStyle(
                          fontSize: 18,
                          color: white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
