import 'package:flutter/material.dart';
import 'package:nothing/reusable/reusablecart.dart';

class meuseumPlace extends StatefulWidget {
  const meuseumPlace({super.key});

  @override
  State<meuseumPlace> createState() => _meuseumPlaceState();
}

// ******************************Linked the reusable widget here ***********************************
class _meuseumPlaceState extends State<meuseumPlace> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        Row(
          children: [
            reusableWidget().ReusableBestPlace(
                "https://kolkatatourism.travel/images/places-to-visit/headers/indian-museum-kolkata-entry-fee-timings-holidays-reviews-header.jpg",
                "Indian Museum ",
                "India, Kolkata"),
            reusableWidget().ReusableBestPlace(
                "https://images.moneycontrol.com/static-mcnews/2023/09/national-770x385.jpg?impolicy=website&width=770&height=431",
                "National Museum ",
                "India, Delhi"),
            reusableWidget().ReusableBestPlace(
                "https://akm-img-a-in.tosshub.com/indiatoday/images/story/201605/shah%2C-rail-museum-6_647_052816091954_0.jpg?VersionId=By.qW1pga47oZWkGXs7.bHWoLdzVrs7b",
                "National Rail Museum",
                "India, Delhi"),
          ],
        )
      ],
    );
  }
}
