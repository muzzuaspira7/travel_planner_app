import 'package:flutter/material.dart';
import 'package:nothing/color/all_colors.dart';
import 'package:nothing/google_map/googlemapLauncher.dart';

class MyCarouselSlider extends StatefulWidget {
  const MyCarouselSlider({super.key});

  @override
  State<MyCarouselSlider> createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider>
    with TickerProviderStateMixin {
  List<String> assets = [
    'https://c4.wallpaperflare.com/wallpaper/272/545/213/nature-landscape-mountains-sea-clouds-hd-wallpaper-preview.jpg',
    'https://media.istockphoto.com/id/1307189136/photo/gateway-of-india-mumbai-maharashtra-monument-landmark-famous-place-magnificent-view-without.jpg?s=612x612&w=0&k=20&c=gGzzkXY5bAVbRbokzrjvkt7Ve-Z3yzSVN04NaMqyBB8=',
    'https://media.gettyimages.com/id/541363304/photo/qutb-minar-and-ruins-of-quwwat-ul-islam-mosque.jpg?s=612x612&w=0&k=20&c=WfN2tzWDZNKGVYY5HU49RTdX6-xT-Asg_Y-lBLcBrek=',
  ];
  List<String> assetsText = [
    'Komodo Island Northen',
    'The Gate Of India',
    'Qutub Minar',
  ];

  List<String> CityName = ['Northen Island', 'Mumbai India', 'Delhi India'];
  final placeLink = [
    'https://www.lonelyplanet.com/indonesia/komodo-rinca-islands',
    'https://www.thrillophilia.com/attractions/gateway-of-india',
    'https://www.makemytrip.com/tripideas/attractions/qutub-minar-delhi',
  ];

  int CurrentCarouselIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
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
                                Colors.black38, BlendMode.darken))),
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
                                  fontFamily: 'Futura',
                                  fontSize: 19,
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
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      fontFamily: 'Futura',
                                      color: Colors.white),
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
                                    'Explore',
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
