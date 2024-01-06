import 'package:flutter/material.dart';
import 'package:nothing/reusable/reusablecart.dart';

class SomePlace extends StatefulWidget {
  const SomePlace({super.key});

  @override
  State<SomePlace> createState() => _SomePlaceState();
}

class _SomePlaceState extends State<SomePlace> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        Row(
          children: [
            reusableWidget().ReusableBestPlace(
                "https://c4.wallpaperflare.com/wallpaper/115/795/754/the-sky-the-sun-clouds-trees-wallpaper-preview.jpg",
                "Moonar",
                "India, Kerala"),
            reusableWidget().ReusableBestPlace(
                "https://media.istockphoto.com/id/492882716/photo/kodaikanal-tamil-nadu-the-picturesque-lake-in-the-british-colonial-town-on-the-palani-hills-in.webp?b=1&s=170667a&w=0&k=20&c=hNJnOWslG431H5gNLn-DY2jLXFl4MGIUlYWV-uMudyA=",
                "Kodaikanal",
                "India, Tamilnadu"),
            reusableWidget().ReusableBestPlace(
                "https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg?auto=compress&cs=tinysrgb&w=600",
                "Taj Mahal",
                "India, Dubai"),
          ],
        )
      ],
    );

  }

}
