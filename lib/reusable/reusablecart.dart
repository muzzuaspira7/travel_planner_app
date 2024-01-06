import 'package:flutter/material.dart';
import 'package:nothing/color/all_colors.dart';

//For the Best place to visit
class reusableWidget {
  ReusableBestPlace(String image, String PlaceName, String CountryName) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 220,
          width: 240,
          decoration: BoxDecoration(
              color: AppColor().ForCardBackground,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: Offset(2, 4),
                    color: AppColor().cardBackgroundColor)
              ]),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    height: 140,
                    width: 250,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
                    )),
                Text(
                  PlaceName,
                  style: TextStyle(
                      color: AppColor().CardHeadingColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColor().HeadingColor,
                    ),
                    Text(
                      CountryName,
                      style: TextStyle(
                        color: AppColor().cardSubheadingColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
