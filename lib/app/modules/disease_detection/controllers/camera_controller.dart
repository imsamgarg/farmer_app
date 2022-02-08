import 'package:camera/camera.dart';
import 'package:camera/src/camera_controller.dart' as c;
import 'package:farmer_app/app/modules/disease_detection/controllers/disease_detection_controller.dart';
import 'package:farmer_app/app/modules/disease_detection/views/req_submission_view.dart';
import 'package:get/get.dart';

class CameraViewController extends GetxController {
  c.CameraController? camController;

  // @override
  // void onInit() async {
  //   super.onInit();

  // }

  late final Future<bool> instance = _initController();

  Future<bool> _initController() async {
    final cameras = await c.availableCameras();
    camController = c.CameraController(cameras[0], ResolutionPreset.max);
    await camController!.initialize();
    return true;
  }

  bool get isCamInitialised => camController?.value.isInitialized ?? false;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    camController!.dispose();
    super.onClose();
  }

  void proceed() async {
    final image = await camController!.takePicture();
    await camController!.pausePreview();
    Get.find<DiseaseDetectionController>().image = image;
    Get.to(() => ReqSubmissionView());
  }
}
