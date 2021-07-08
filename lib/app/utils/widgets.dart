import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/route_manager.dart';
import 'colors.dart';
import 'constants.dart';
import 'utils.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(String title,
      {Color? color, List<Widget>? actions, VoidCallback? onTap})
      : super(
          leading: InkWell(
            onTap: onTap ??
                () {
                  Get.back();
                },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: accentColor,
            ),
          ),
          actions: actions,
          backgroundColor: color,
          title: title.text.semiBold.color(accentColor).make(),
          centerTitle: true,
        );
}

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
          title: title.text.bold.color(accentColor).make(),
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
                color: primaryColors[2],
              ),
              Align(
                  alignment: Alignment.center,
                  child: "Or"
                      .text
                      .size(16)
                      .color(primaryColors[2])
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

// class CustomDropDown extends StatelessWidget {
//   final List<String> items;
//   final void Function(String?) onChanged;
//   final String hint;
//   final Color? color;
//   final String? Function(String?)? validator;
//   final AutovalidateMode autovalidateMode;
//   final bool isBlue;
//   final bool enabled;
//
//   const CustomDropDown(
//       {Key? key,
//       required this.items,
//       required this.onChanged,
//       required this.hint,
//       this.validator,
//       this.autovalidateMode = AutovalidateMode.onUserInteraction,
//       this.isBlue = false,
//       this.enabled = true,
//       this.color})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final List<DropdownMenuItem<String>> _items = items
//         .map(
//           (e) => DropdownMenuItem(
//             value: e,
//             child: e.text.color(isBlue ? accentColor : primaryColors[3]).make(),
//           ),
//         )
//         .toList(growable: false);
//     return DropdownButtonFormField<String>(
//       items: _items,
//       decoration: InputDecoration(enabled: enabled),
//       elevation: 2,
//       onChanged: onChanged,
//       autovalidateMode: autovalidateMode,
//       validator: validator,
//       icon: Image.asset(
//         isBlue ? downArrowBlue : downArrow,
//       ),
//       hint: hint.text
//           .size(16)
//           .color(isBlue ? accentColor : primaryColors[1])
//           .make(),
//     );
//   }
// }

class CustomNavigationBar extends StatelessWidget {
  final NavigateScreen screen;

  const CustomNavigationBar({Key? key, required this.screen}) : super(key: key);

  _text(String text, Color color) =>
      text.text.xs.semiBold.size(14).color(color).make().box.py3.make();

  _color(NavigateScreen _screen) =>
      _screen == screen ? accentColor : primaryColors[2];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 15,
      child: Hero(
        tag: "bottomAppBar",
        child: Material(
          color: whiteColor,
          child: Container(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if (screen != homeScreen) {
                        Get.until((route) => Get.currentRoute == Routes.HOME);
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_rounded,
                          color: _color(
                            NavigateScreen.Home,
                          ),
                        ),
                        _text(
                          "Home",
                          _color(
                            NavigateScreen.Home,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.CREATE_POST);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle_outline_rounded,
                          color: _color(
                            NavigateScreen.Post,
                          ),
                        ),
                        _text(
                          "Post",
                          _color(
                            NavigateScreen.Post,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.PROFILE);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle_rounded,
                          color: _color(
                            NavigateScreen.Profile,
                          ),
                        ),
                        _text(
                          "Profile",
                          _color(
                            NavigateScreen.Profile,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
      backgroundColor: accentColor,
      child: Icon(Icons.add),
    );
  }
}

// class DeviceTile extends CustomTile {
//   DeviceTile({
//     required String title,
//     required String image,
//   }) : super(
//             title: title,
//             image: image,
//             trailing: Image.asset(
//               rightArrow,
//               height: 24,
//             ));
// }
//
// class EnergyInfoTile extends CustomTile {
//   EnergyInfoTile({
//     required String title,
//     required String image,
//     watts,
//   }) : super(
//           trailing: messageStyle("$watts W"),
//           image: image,
//           title: title,
//         );
// }

// class CustomSwitchTile extends CustomTile {
//   CustomSwitchTile({
//     required bool value,
//     required String title,
//     required String image,
//     void Function(bool)? onChanged,
//     Key? key,
//   }) : super(
//           key: key,
//           title: title,
//           image: image,
//           trailing: CupertinoSwitch(
//             activeColor: accentColor,
//             value: value,
//             onChanged: onChanged,
//           ).scale(scaleValue: 0.6),
//           onTap: () {
//             onChanged!(!value);
//           },
//         );
// }

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
          .color(primaryColors[4])
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
            color: primaryColors[3],
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
        color: accentColor,
        height: 170,
        padding: sidePadding,
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

// class PasswordField extends StatefulWidget {
//   final TextEditingController controller;
//
//   final onFieldSubmitted;
//
//   const PasswordField(
//     this.controller, {
//     Key? key,
//     this.onFieldSubmitted,
//   }) : super(key: key);
//
//   @override
//   _PasswordFieldState createState() => _PasswordFieldState();
// }
//
// class _PasswordFieldState extends State<PasswordField> {
//   bool isVisible = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.controller,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       obscureText: isVisible,
//       onFieldSubmitted: widget.onFieldSubmitted,
//       validator: (value) => emptyValidator(value, "Password"),
//       decoration: InputDecoration(
//         hintText: "Enter Your Password",
//         suffixIcon: GestureDetector(
//           onTap: () {
//             setState(() {
//               isVisible ? isVisible = false : isVisible = true;
//             });
//           },
//           child: Icon(
//             isVisible
//                 ? Icons.visibility_outlined
//                 : Icons.visibility_off_outlined,
//             color: isVisible ? accentColor : Colors.grey,
//           ),
//         ),
//       ),
//     );
//   }
// }

class AppHeading extends StatelessWidget {
  const AppHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            horSpacing15,
            Image.asset(
              logoSm,
              height: 25,
              width: 25,
            ),
            horSpacing10,
            appName.text.size(18).color(accentColor).make(),
          ],
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                Get.toNamed(Routes.NOTIFICATIONS);
              },
              child: Stack(
                children: [
                  Icon(Icons.notifications_none_rounded),
                ],
              ),
            ),
            horSpacing10,
          ],
        )
      ],
    );
  }
}
