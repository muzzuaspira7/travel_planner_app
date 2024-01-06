import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nothing/color/all_colors.dart';
import 'package:nothing/reusable/catagories.dart';
import 'package:nothing/screens/SomePlace.dart';
import 'package:nothing/slider/bookTicket.dart';
import 'package:nothing/slider/carousel.dart';
import 'meuseum.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  // Search bar
  bool _isSearching = false;
  final CollectionReference _cities =
      FirebaseFirestore.instance.collection('cities');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor().blue,
        elevation: 0,
        flexibleSpace: Container(),
        leading: const Icon(
          Icons.notes_sharp,
          size: 30,
          color: Colors.black,
        ),
        title: _isSearching
            ? const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Search your trip'),
                autofocus: true,
                style: TextStyle(fontSize: 17, letterSpacing: 0.5),
                // onChanged: (val){
                // },
              )
            : const Text(
                'Travel Karo',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    // fontFamily: 'HeadingText',
                    color: Colors.black,
                    fontSize: 23,
                    letterSpacing: 0.8),
              ),
        actions: [
          IconButton(
              color: AppColor().black,
              onPressed: () {
                setState(() {
                  _isSearching = !_isSearching;
                });
              },
              icon: Icon(_isSearching
                  ? CupertinoIcons.clear_circled_solid
                  : Icons.search)),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/user.jpg'),
            ),
          )
        ],
      ),
      body: Container(
        // color: Color(0xffd1d0cf),
        color: AppColor().AllBgColor,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const MyCarouselSlider(),
                  const SizedBox(
                    height: 15,
                  ),
                  //Catagories
                  Text(
                    'Catagories',
                    style: TextStyle(
                        color: AppColor().HeadingColor,
                        fontFamily: 'Poppins',
                        fontSize: 23,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const CategoriesSection(),
                  // Best Place to visit
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Best Place to Visit',
                        style: TextStyle(
                            color: AppColor().HeadingColor,
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins'),
                      ),
                      const SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: SomePlace(),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //Catagories
                  Text(
                    'Book Your Ticket',
                    style: TextStyle(
                        color: AppColor().HeadingColor,
                        fontFamily: 'Poppins',
                        fontSize: 23,
                        fontWeight: FontWeight.w600),
                  ),
                  TicketBooking(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Museums In India',
                        style: TextStyle(
                            color: AppColor().HeadingColor,
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins'),
                      ),
                      SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: meuseumPlace(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
