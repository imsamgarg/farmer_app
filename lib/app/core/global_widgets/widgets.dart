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
  }) : super(key: key);

  final Color? color;
  final double? size;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.check_circle,
      color: color ?? Theme.of(context).colorScheme.primary,
      size: size,
    )
        .box
        .border(
          color: color ?? Theme.of(context).colorScheme.primary,
          width: borderWidth ?? 2,
        )
        .make();
  }
}

class Crop extends StatelessWidget {
  const Crop({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          type: MaterialType.circle,
          color: Vx.gray200,
          child: Center(
            child: Image.asset(image),
          ),
        ),
        verSpacing4,
        name.text.make(),
      ],
    );
  }
}

class CropDisease extends StatelessWidget {
  const CropDisease({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(child: Image.asset(name)),
        verSpacing4,
        name.text.make(),
      ],
    );
  }
}
