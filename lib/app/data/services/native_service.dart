import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NativeService extends GetxService {
  Future<XFile?> pickImageFromGallery() async {
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  }
}
