import 'package:flutter/material.dart';
import 'package:nothing/color/all_colors.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2.0)],
              color: AppColor().ForCardBackground,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 80,
          width: 80,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 40,
                  child: Image(image: AssetImage('assets/images/island.png'))),
              Text('Island')
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2.0)],
              color: AppColor().ForCardBackground,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 80,
          width: 80,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 40,
                  child: Image(image: AssetImage('assets/images/beach.png'))),
              Text('Beach')
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2.0)],
              color: AppColor().ForCardBackground,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 80,
          width: 80,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 40,
                  child:
                      Image(image: AssetImage('assets/images/mountains.png'))),
              Text('Mountains')
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2.0)],
              color: AppColor().ForCardBackground,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 80,
          width: 80,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 40,
                  child: Image(image: AssetImage('assets/images/hotel.png'))),
              Text('Hotel')
            ],
          ),
        )
      ],
    );
  }
}
