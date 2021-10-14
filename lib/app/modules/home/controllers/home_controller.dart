import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late List<String> categories;
  late final instance = _getData();

  final _pageIndex = 0.obs;
  get pageIndex => this._pageIndex.value;
  set pageIndex(value) => this._pageIndex.value = value;

  void onPageChange(int value) {
    pageIndex = value;
  }

  void onBackPress() {
    pageIndex = 0;
  }

  Future<bool> _getData() async {
    categories = await getDbService().getCategories();
    return true;
  }

  Future<bool> controlBackPress() async {
    if (pageIndex == 0) {
      return true;
    } else {
      pageIndex = 0;
      return false;
    }
  }
}
