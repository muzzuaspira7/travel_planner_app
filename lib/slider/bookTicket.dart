import 'package:flutter/material.dart';
import 'package:nothing/color/all_colors.dart';
import 'package:nothing/google_map/googlemapLauncher.dart';

class TicketBooking extends StatefulWidget {
  const TicketBooking({super.key});

  @override
  State<TicketBooking> createState() => _TicketBookingState();
}

class _TicketBookingState extends State<TicketBooking>
    with TickerProviderStateMixin {
  List<String> assets = [
    'https://media.istockphoto.com/id/155439315/photo/passenger-airplane-flying-above-clouds-during-sunset.jpg?s=612x612&w=0&k=20&c=LJWadbs3B-jSGJBVy9s0f8gZMHi2NvWFXa3VJ2lFcL0=',
    'https://www.thestatesman.com/wp-content/uploads/2021/10/trains.jpg',
    'https://static.ewebbuddy.com/2018/11/BusTickets-India.jpg',
  ];
  List<String> assetsText = [
    'Airplane Ticket',
    'Bus Ticket',
    'Train Ticket',
  ];

  List<String> CityName = ['10% Off', '12% Off', '10% off'];
  final placeLink = [
    'https://www.makemytrip.com/railways/',
    'https://www.goibibo.com/?utm_source=google&utm_medium=cpc&utm_campaign=DF-Generic-EM&utm_content=Tickets-Exact&utm_term=!SEM!DF!G!Generic!RSA!12554947352!121063961722!654769882497!e!flight%20booking%20online!c!&gad_source=1&gclid=CjwKCAiA7t6sBhAiEiwAsaieYqzqrzvb49xf-uNcxZEaSW7WewrvWZogVc-tVjAVXiRtxBIUdg7wgBoCK6IQAvD_BwE',
    'https://www.redbus.in/',
  ];

  int CurrentCarouselIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
              itemCount: assetsText.length,
              controller: PageController(
                initialPage: 1,
                viewportFraction: 0.9,
              ),
              onPageChanged: (value) {
                CurrentCarouselIndex = value;
                setState(() {});
              },
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.all(5),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        image: DecorationImage(
                            image: NetworkImage(
                              assets[index],
                            ),
                            fit: BoxFit.cover,
                            colorFilter: const ColorFilter.mode(
                                Color.fromARGB(135, 0, 0, 0),
                                BlendMode.darken))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 15, left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: Text(
                              assetsText[index],
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  // fontFamily: 'Futura',
                                  fontSize: 18,
                                  letterSpacing: 1,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  CityName[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23,
                                      // fontFamily: 'Futura',
                                      color: AppColor().blue),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    MapUtils.Chrome(placeLink[index]);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor().buttonColor,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 0),
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  child: const Text(
                                    'Book Now',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ));
              }),
        ),
        TabPageSelector(
          selectedColor: AppColor().HeadingColor,
          controller: TabController(
              length: assets.length,
              initialIndex: CurrentCarouselIndex,
              vsync: this),
        )
      ],
    );
  }
}
