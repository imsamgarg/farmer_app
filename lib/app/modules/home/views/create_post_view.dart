import 'package:custom_utils/future.dart';
import 'package:farmer_app/app/core/global_widgets/widgets.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/core/utils/mixins.dart';
import 'package:farmer_app/app/modules/home/controllers/create_post_controller.dart';
import 'package:farmer_app/app/modules/home/controllers/home_controller.dart';
import 'package:farmer_app/app/modules/home/local_widgets/control_back_press.dart';
import 'package:farmer_app/app/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import 'package:custom_utils/spacing_utils.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/core/global_widgets/button.dart';
import 'package:farmer_app/app/core/theme/color_theme.dart';
import 'package:farmer_app/app/core/theme/sizing_theme.dart';

class CreatePostView extends GetView<CreatePostController> {
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return ControlBackPress(
      child: CustomFutureBuilder(
        loading: CenterLoading(),
        future: controller.instance,
        builder: (snapshot) {
          return Scaffold(
            appBar: CustomAppBar(
              "Create Post",
              automaticallyImplyLeading: false,
              leadingIcon: Icons.arrow_back_ios_new_rounded,
              leadingPress: homeController.onBackPress,
              actions: [PostButton()],
            ),
            body: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Dp(),
                  verSpacing10,
                  PostSummary(),
                  verSpacing20,
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Add Image"
                          .text
                          .semiBold
                          .color(ColorTheme.primaryColors[2])
                          .make(),
                      verSpacing10,
                      UploadImageButton()
                    ],
                  ),
                  verSpacing20,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Select Categories"
                          .text
                          .semiBold
                          .color(ColorTheme.primaryColors[2])
                          .make(),
                      verSpacing10,
                      Categories(),
                    ],
                  ),
                ],
              ).px16(),
            ).scrollVertical(),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<CreatePostController> {
  @override
  Widget build(BuildContext context) {
    // return Obx(
    // () {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      children: [
        for (var i = 0; i < controller.categories.length; i++) SwitchChip(i: i),
      ],
    );
    // },
    // );
  }
}

class SwitchChip extends GetView<CreatePostController> {
  const SwitchChip({
    Key? key,
    required this.i,
  }) : super(key: key);
  final int i;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomChip(
        controller.categories[i],
        isActive: controller.selectedCategory == i,
        onTap: () => controller.selectCategory(i),
      ),
    );
  }
}

class UploadImageButton extends GetView<CreatePostController> {
  const UploadImageButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.cloud_upload_outlined, size: 16, color: Vx.white
                  // color: ColorTheme.primaryColors[2],
                  ),
              horSpacing10,
              "Upload Image"
                  .text
                  .color(
                    // ColorTheme.primaryColors[2]
                    Vx.white,
                  )
                  .make(),
            ],
          ),
          // overlayColor: ColorTheme.primaryColors[3],
          onPressed: controller.pickImage,
          // bgColor: ColorTheme.primaryColors[4],
        ),
        horSpacing10,
        GetBuilder(
          init: controller,
          id: controller.imageNameId,
          builder: (c) {
            return controller.imageName.shortImageName.text.make();
          },
        ),
      ],
    );
  }
}

class Dp extends GetView<CreatePostController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          ProfilePicture(
            url: controller.picture ?? "",
            name: controller.name,
          ),
          horSpacing10,
          controller.name.text.semiBold
              .size(16)
              .color(ColorTheme.primaryColors[1])
              .make(),
        ],
      ).p8(),
    );
  }
}

class PostButton extends GetView<CreatePostController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreatePostController>(
      init: controller,
      id: controller.buttonLoadingId,
      builder: (_) {
        return CustomButton(
          child: "Post".text.semiBold.color(ColorTheme.primaryColors[1]).make(),
          bgColor: Colors.transparent,
          fgColor: primaryColor(context),
          isLoading: controller.isButtonLoading,
          overlayColor: ColorTheme.primaryColors[3],
          onPressed: controller.createPost,
        );
      },
    );
  }
}

class PostSummary extends GetView<CreatePostController> with Validators {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        key: controller.formKey,
        minLines: 6,
        autofocus: false,
        maxLines: 6,
        controller: controller.postSummaryController,
        decoration: InputDecoration(
          hintText: "What's on your mind?",
          border: OutlineInputBorder(
            borderRadius: Sizing.borderRadius,
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: Sizing.borderRadius,
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: Sizing.borderRadius,
            borderSide: BorderSide.none,
          ),
          fillColor: ColorTheme.primaryColors[4],
          filled: true,
        ),
        validator: requiredValidator,
      ),
    );
  }
}
