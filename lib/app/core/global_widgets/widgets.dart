import 'package:farmer_app/app/modules/disease_detection/views/verify_disease_view.dart';
import 'package:flutter/material.dart';

import 'package:custom_utils/spacing_utils.dart';
import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:farmer_app/app/core/theme/color_theme.dart';
import 'package:farmer_app/app/core/theme/sizing_theme.dart';
import 'package:farmer_app/app/core/values/strings.dart';
import 'package:farmer_app/app/core/values/values.dart';

class CustomSliverAppBar extends SliverAppBar {
  CustomSliverAppBar(String title,
      {Color? color, List<Widget>? actions, VoidCallback? onTap})
      : super(
          leading: InkWell(
            onTap: onTap ?? () => Get.back(),
            child: Image.asset(
              leftArrow,
            ),
          ),
          actions: actions,
          backgroundColor: color,
          title: title.text.bold.color(ColorTheme.accentColor).make(),
          centerTitle: true,
        );
}

class OrWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Container(
          child: Stack(
            children: [
              Divider(
                color: ColorTheme.primaryColors[2],
              ),
              Align(
                  alignment: Alignment.center,
                  child: "Or"
                      .text
                      .size(16)
                      .color(ColorTheme.primaryColors[2])
                      .make()
                      .box
                      .white
                      .px16
                      .make()),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}

class PlusFloatingButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PlusFloatingButton(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      elevation: 2,
      backgroundColor: ColorTheme.accentColor,
      child: Icon(Icons.add),
    );
  }
}

class CustomTile extends StatelessWidget {
  final VoidCallback? onTap;
  final String image;
  final Widget trailing;
  final String title;

  const CustomTile(
      {Key? key,
      required this.image,
      required this.title,
      required this.trailing,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _Info(image: image, title: title),
            trailing,
          ],
        ),
      )
          .box
          .color(ColorTheme.primaryColors[4])
          .withRounded(value: radius)
          .make()
          .onTap(onTap ?? () {}),
    );
  }
}

class _Info extends StatelessWidget {
  const _Info({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipOval(
          child: Container(
            color: ColorTheme.primaryColors[3],
            child: Image.asset(
              image,
              height: 40,
              width: 40,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        (title).text.size(16).make(),
      ],
    );
  }
}

class Header extends StatelessWidget {
  final String title;
  final String info;

  const Header({
    Key? key,
    required this.title,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: ColorTheme.accentColor,
        height: 170,
        padding: Sizing.sidePadding,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title.text.size(24).white.make(),
              info.text.light.white.make(),
            ],
          ),
        ),
      ),
    );
  }
}

class Mask extends StatelessWidget {
  const Mask({
    Key? key,
    this.color,
    this.size,
    this.borderWidth,
    this.iconSize,
  }) : super(key: key);

  final Color? color;
  final double? size;
  final double? iconSize;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: Icon(
        Icons.check_circle_rounded,
        color: color ?? Theme.of(context).colorScheme.primary,
        size: iconSize ?? 30,
      ),
    )
        .box
        .color(Vx.black.withOpacity(0.5))
        .border(
          color: color ?? Theme.of(context).colorScheme.primary,
          width: borderWidth ?? 2,
        )
        .roundedFull
        .make();
  }
}

class Crop extends StatelessWidget {
  const Crop({
    Key? key,
    required this.image,
    required this.name,
    this.isActive = false,
  }) : super(key: key);

  final String image;
  final String name;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Material(
              type: MaterialType.circle,
              color: Vx.gray100,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  image,
                  height: 60,
                  width: 60,
                ),
              ),
            ),
            if (isActive)
              Mask(
                size: 100,
              ),
          ],
        ),
        verSpacing4,
        if (isActive)
          name.text.bold
              .color(
                Theme.of(context).colorScheme.primary,
              )
              .sm
              .make(),
        if (!isActive) name.text.sm.make(),
      ],
    ).onTap(() {
      Get.to(() => VerifyDiseaseView());
    });
  }
}

class CropDisease extends StatelessWidget {
  const CropDisease({
    Key? key,
    required this.name,
    required this.image,
    this.isActive = false,
  }) : super(key: key);

  final String name;
  final String image;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipOval(
              child: SizedBox(
                height: 102,
                width: 102,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            if (isActive)
              Mask(
                size: 100,
              )
          ],
        ),
        verSpacing4,
        if (isActive)
          name.text.bold
              .color(
                Theme.of(context).colorScheme.primary,
              )
              .sm
              .make(),
        if (!isActive) name.text.sm.make(),
      ],
    );
  }
}

class RequestStatusCard extends StatelessWidget {
  const RequestStatusCard({
    Key? key,
    required this.heading,
    required this.message,
  }) : super(key: key);

  final String heading;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  heading.text.bold.color(Vx.gray600).make(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: Vx.gray600,
                  ),
                ],
              ),
              verSpacing20,
              message.text.lineHeight(1.7).make(),
            ],
          ),
        ),
      ).box.roundedSM.color(Vx.gray100).make(),
    );
  }
}
