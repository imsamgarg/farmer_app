// import 'dart:html';

// imporsage:get/get.dart';

// import 'package:flutter/material.dart';

// cascade() {
//   Paint paint = Paint();
//   paint.color = Colors.blue;
//   paint.strokeWidth = 2;
//   paint.style = PaintingStyle.fill;

//   Paint paint = Paint()
//     ..color = Colors.blue
//     ..strokeWidth = 2
//     ..style = PaintingStyle.fill;
// }

// routeGet(context) {
//   Get.to(Screen());

//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => Screen(),
//     ),
//   );
// }
// class User {
//   String? name;
//   String? email;
//   printDetail() {}
// }

// nullSafeFunctionCall(User? user) {
//   if (user != null) {
//     if (user.email != null) {
//       user.printDetail();
//     }
//   }

//   user?.printDetail();
// }

// web() {
//   //Returns a boolean(true/false)
//   Platform.isAndroid;
//   Platform.isFuchsia;
//   Platform.isMacOS;
//   Platform.isIOS;
//   Platform.isWindows;
//   Platform.isLinux;

//   if (identical(0.0, 0)) {
//     print("we're on web");
//   }

//   //if you are using flutter
//   if (kIsWeb) {
//     print("we're on web");
//   }
// }

// timer() {
//   int counter = 0;
//   Timer.periodic(Duration(seconds: 1), (timer) {
//     if (counter == 10) {
//       timer.cancel();
//     }
//     print("Counter: $counter");
//     counter++;
//   });
// }
// class Screen extends Widget {}

// class Widget_ extends StatefulWidget {
//   Widget_({Key? key}) : super(key: key);

//   @override
//   _Widget_State createState() => _Widget_State();
// }

// class _Widget_State extends State<Widget_> with SingleTickerProviderStateMixin {
//   AnimationController? animController;

//   @override
//   void initState() {
//     animController = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     super.initState();
//   }

//   //  animation == IntTween(begin: 0, end: 255).animate(animController!);
//   // textController = TextEditingController();
// // Animation<int>? animation;
//   // TextEditingController? textController;

//   late final textController = TextEditingController();
//   late final animController = AnimationController(
//     duration: Duration(milliseconds: 500),
//     vsync: this,
//   );
//   late final animation = IntTween(begin: 0, end: 255).animate(animController);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
// main(List<String> args) {
//   final map = {
//     "a": "a",
//     "b": "a",
//     "c": "a",
//     // null: null,
//     "d": "a",
//   };
//   for (var key in map.keys) {
//     // print(map[key]);
//     print(map[null]);
//   }
// }

import 'package:flutter/material.dart';

///
///{
/// Hive: noSql 100%dart web, 2306
/// Sembast: noSql 100%dart web 524
/// ObjectDb: noSql 100%dart web 69
/// ObjectBox: noSql Native no Web 285
/// Sqflite: Sql Native only android ios macos 2127
///}
///
///
/// Icon Packs
///{
/// font_awesome icons
/// line_icons
/// ionicons 1332 icons
///}
///
//////flutter navigation made easy
// ///<tr>
//       <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/WanderingCubes.gif"
//       <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/PouringHourGlass.gif"
//       <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/RotatingPlane.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/DoubleBounce.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/Wave.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/FadingFour.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/FadingCube.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/Pulse.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/ChasingDots.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/ThreeBounce.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/Circle.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/CubeGrid.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/FadingCircle.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/RotatingCircle.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/FoldingCube.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/heart.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/hour-glass.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/pouring-hour-glass-refined.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/grid.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/ring.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/ripple.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/spinning-circle.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/spinning-lines.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/abhishek0706/flutter_spinkit/square_circle/screenshots/square_circle.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/dual-ring.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/piano-wave.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/dancing-square.gif" width="100px" height="100px">
//       <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/three-in-out.gif" width="100px" height="100px">

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// import 'package:flutter_spinkit/flutter_spinkit.dart';

// void main(List<String> args) {
//   final loading = SpinKitFadingCircle(
//     color: Colors.blue,
//     size: 50,
//   );
// }

///Hide Widget
///opacity :occupy space , interactivity
///

// class User {
//   User();
//   A? membership = A();
//   printDetail() {}
// }

// class A {
//   A();

//   final bool? isPro = true;
// }

// void main(List<String> args) {
//   // final emailController;
//   // final passController;
//   // final User? user = User();

//   // if (user != null) {
//   //   user.printDetail();
//   // }

//   // user?.printDetail();

//   // var isProUser = user?.membership?.isPro ?? false;

//   // var isProUser = false;

//   // if (user!.membership != null) {
//   //   if (user.membership!.isPro == true) {
//   //     isProUser = true;
//   //   }
//   // }
// }

// class Noob extends StatefulWidget {
//   const Noob({Key? key}) : super(key: key);

//   @override
//   _NoobState createState() => _NoobState();
// }

// class _NoobState extends State<Noob> {
//   late final emailController = TextEditingController();
//   late final passController = TextEditingController();

//   // @override
//   // void initState() {
//   //   emailController = TextEditingController();
//   //   passController = TextEditingController();
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
void main(List<String> args) {
  final countriesList = ["Usa", "India", "Usa"];

  final countriesSet = {"Usa", "India", "Usa"};

  VoidCallback? onTap;

  if (onTap != null) {
    onTap();
  }

  onTap?.call();
}

class Noob extends StatelessWidget {
  const Noob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //  👇  👇
      itemBuilder: (_, __) {
        return Text("data");
      },
    );
  }
}
