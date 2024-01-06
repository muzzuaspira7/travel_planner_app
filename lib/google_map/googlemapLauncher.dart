import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();
//THis is for google map
  static Future<void> openMap(String origin, String destiny) async {
    String googleMapurl = "https://www.google.com/maps/dir/$origin/$destiny/";
    try {
      await launch(googleMapurl);
    } catch (e) {
      throw e;
    }
  }

  //THis is for google Chrome
  static Future<void> Chrome(String Location) async {
    String googleChromeurl = Location;
    try {
      await launch(googleChromeurl);
    } catch (e) {
      throw e;
    }
  }
}
