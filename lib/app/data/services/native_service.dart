import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

class NativeService extends GetxService {
  late final Location location = Location.instance;

  Future<XFile?> pickImageFromGallery() async {
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Future<LocationData> getLocation() async {
    return await location.getLocation();
  }

  Future<bool> getLocationPermission() async {
    if (!await location.serviceEnabled()) {
      final v = await location.requestService();
      if (!v) return false;
    }
    if ((await location.hasPermission()) != PermissionStatus.granted) {
      final v = await location.requestPermission();
      if (v != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }
}

// class PermissionException implements Exception {
//   final String msg;
//   PermissionException(this.msg);

//   @override
//   String toString() {
//     return msg;
//   }
// }
