import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BuyInputController extends GetxController {
  final links = [
    "https://www.amazon.in/Fertilizer-Soil/b?ie=UTF8&node=3638818031",
    "https://www.ugaoo.com/plant-care/plant-growth/fertilizers.html",
    "https://www.bigbasket.com/pc/kitchen-garden-pets/gardening/fertilizers-pesticides/",
    "https://agribegri.com/fertilizers/buy-cheap-chemical-fertilizers-online-in-india.php",
    "https://www.iffcobazar.in/en/fertilisers",
  ];

  Future<void> openLink(int index) async {
    if (await canLaunch(links[index])) {
      await launch(links[index]);
    }
  }
}
