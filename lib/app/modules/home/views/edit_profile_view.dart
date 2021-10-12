import 'dart:io';

import 'package:farmer_app/app/core/global_widgets/widgets.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/core/utils/mixins.dart';
import 'package:farmer_app/app/modules/home/controllers/home_controller.dart';
import 'package:farmer_app/app/modules/home/controllers/profile_route_controller.dart';
import 'package:farmer_app/app/modules/home/controllers/profile_controller.dart';
import 'package:farmer_app/app/modules/home/local_widgets/control_back_press.dart';
import 'package:flutter/material.dart';

import 'package:custom_utils/spacing_utils.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/core/global_widgets/button.dart';
import 'package:farmer_app/app/core/theme/color_theme.dart';

class EditProfileView extends GetView<ProfileController> {
  final profileRoutes = Get.find<ProfileRoutesController>();
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return ControlBackPress(
      child: Scaffold(
        appBar: CustomAppBar(
          "Edit Profile",
          automaticallyImplyLeading: false,
          leadingIcon: Icons.arrow_back_ios_new_rounded,
          leadingPress: goBack,
          actions: [EditButton()],
        ),
        body: Container(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ProfileImage(), verSpacing5, ChangeImageButton()],
                ),
                "Name".text.make(),
                NameField(),
                verSpacing20,
                "Phone Number".text.make(),
                NumberField(),
                verSpacing20,
                "Address".text.make(),
                AddressField(),
                verSpacing15,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ("Land Details")
                              .text
                              .bold
                              .color(ColorTheme.primaryColors[2])
                              .make(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: ColorTheme.primaryColors[2],
                            size: 20,
                          )
                        ],
                      ),
                      onPressed: profileRoutes.dummyButton,
                      bgColor: ColorTheme.whiteColor,
                      overlayColor: ColorTheme.primaryColors[4],
                    ),
                    CustomButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ("Your Crops")
                              .text
                              .bold
                              .color(ColorTheme.primaryColors[2])
                              .make(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: ColorTheme.primaryColors[2],
                            size: 20,
                          )
                        ],
                      ),
                      onPressed: profileRoutes.dummyButton,
                      bgColor: ColorTheme.whiteColor,
                      overlayColor: ColorTheme.primaryColors[4],
                    ),
                    CustomButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ("About")
                              .text
                              .bold
                              .color(ColorTheme.primaryColors[2])
                              .make(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: ColorTheme.primaryColors[2],
                            size: 20,
                          )
                        ],
                      ),
                      onPressed: profileRoutes.dummyButton,
                      bgColor: ColorTheme.whiteColor,
                      overlayColor: ColorTheme.primaryColors[4],
                    ),
                    CustomButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ("logout")
                              .text
                              .bold
                              .color(ColorTheme.primaryColors[2])
                              .make(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: ColorTheme.primaryColors[2],
                            size: 20,
                          )
                        ],
                      ),
                      onPressed: controller.logout,
                      bgColor: ColorTheme.whiteColor,
                      overlayColor: ColorTheme.primaryColors[4],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ).px20().scrollVertical(),
      ),
    );
  }
}

class ProfileImage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: GetBuilder<ProfileController>(
          init: controller,
          id: controller.imageId,
          builder: (_) {
            return Container(
              height: 80,
              width: 80,
              child: (controller.image == null)
                  ? ProfilePicture(
                      url: controller.profileImage,
                      name: controller.name,
                    )
                  : Image.file(
                      File(
                        controller.image!.path,
                      ),
                      fit: BoxFit.cover,
                    ),
            );
          },
        ),
      ),
    );
  }
}

class EditButton extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return MixinBuilder(
      init: controller,
      id: controller.loadingButtonId,
      builder: (_) {
        return CustomButton(
          bgColor: Colors.transparent,
          fgColor: Theme.of(context).primaryColor,
          onPressed: controller.editProfile,
          isLoading: controller.isEditButtonLoading,
          child: (controller.editingEnabled ? "Save" : "Edit")
              .text
              .semiBold
              .black
              .make(),
        );
      },
    );
  }
}

class ChangeImageButton extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.editingEnabled)
          return CustomButton(
            child: ("Change Profile Picture").text.underline.make(),
            onPressed: controller.changePicture,
            bgColor: ColorTheme.whiteColor,
            overlayColor: ColorTheme.primaryColors[3],
            fgColor: Color(0xffEB4225),
          );
        else
          return SizedBox.shrink();
      },
    );
  }
}

class AddressField extends GetView<ProfileController> with Validators {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        minLines: 1,
        maxLines: null,
        readOnly: !controller.editingEnabled,
        decoration: InputDecoration(contentPadding: EdgeInsets.zero),
        controller: controller.addressController,
      ),
    );
  }
}

class NumberField extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: controller.number,
      readOnly: true,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(top: 12),
          child: "🇮🇳 +91 ".text.size(16).make(),
        ),
        prefixStyle: TextStyle(color: Colors.black, fontSize: 16),
      ),
    );
  }
}

class NameField extends GetView<ProfileController> with Validators {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        decoration: InputDecoration(contentPadding: EdgeInsets.zero),
        controller: controller.nameController,
        readOnly: !controller.editingEnabled,
        validator: (v) => nameValidotor(v),
      ),
    );
  }
}
