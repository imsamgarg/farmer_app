import 'package:camera/camera.dart';
import 'package:custom_utils/future.dart';
import 'package:farmer_app/app/core/global_widgets/widgets.dart';
import 'package:farmer_app/app/modules/disease_detection/controllers/camera_controller.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class CameraView extends GetView<CameraViewController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CameraViewController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          body: CustomFutureBuilder(
            builder: (_) {
              return ValueListenableBuilder(
                valueListenable: controller.camController!,
                builder: (context, value, child) {
                  return Stack(
                    children: [
                      controller.camController!.buildPreview(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: const CameraControls(),
                      ),
                    ],
                  );
                },
              );
            },
            future: controller.instance,
            loading: CenterLoading(),
            errorBuilder: (_) {
              print(_);
              return Center(child: Text(_.toString()));
            },
          ),
        );
      },
    );
  }
}

class CameraControls extends GetView<CameraViewController> {
  const CameraControls({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 100,
        child: Center(
          child: IconButton(
            iconSize: 48,
            onPressed: controller.proceed,
            icon: Icon(
              Icons.camera,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
