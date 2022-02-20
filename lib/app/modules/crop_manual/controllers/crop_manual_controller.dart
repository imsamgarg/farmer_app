import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CropManualController extends GetxController {
  // void onDiseaseSelect(int i, int j) {
  //   Get.to(() => ManualView());
  // }

  final links = [
    "https://www.pau.edu/fportalnew/",
    "https://play.google.com/store/apps/details?id=com.pau.extension",
    "https://play.google.com/store/apps/details?id=com.pau.soils&hl=en_IN",
    "https://agri.punjab.gov.in/?q=agriculture-crops",
  ];

  Future<void> openLink(int index) async {
    if (await canLaunch(links[index])) {
      await launch(links[index]);
    }
  }

  // void nextInfo() {}
}
