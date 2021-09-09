import 'package:farmer_app/app/routes/app_pages.dart';
import 'package:farmer_app/app/core/global_widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Yeomen",
      initialRoute: Routes.WELCOME,
      getPages: AppPages.routes,
    );
  }
}

void main() {
  testWidgets("Launch Screen Test", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(Get.currentRoute, Routes.WELCOME);
    await tester.tap(find.widgetWithText(TextButton, "Get Started"));
    await tester.pump();
    expect(Get.currentRoute, Routes.GET_STARTED,
        reason: "Get started screent te agya");
    await tester.tap(find.byType(NextButton));
    await tester.pump();
    expect(Get.currentRoute, Routes.GET_STARTED);
  });
}
