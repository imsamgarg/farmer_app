import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/theme/color_theme.dart';
import 'package:farmer_app/app/core/values/strings.dart';
import 'package:farmer_app/app/modules/home/local_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class FeedView extends StatelessWidget {
  styleChip(String text) => text.text
      .color(ColorTheme.primaryColors[2])
      .size(15)
      .make()
      .box
      .p8
      .border(color: ColorTheme.primaryColors[3])
      .make();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: context.screenHeight * 0.2,
                child: Column(
                  children: [
                    Expanded(child: AppHeading()),
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            horSpacing15,
                            GestureDetector(
                              onTap: () {
                                // VxBottomSheet.bottomSheetView(context,
                                //     child: Container(),
                                //     roundedFromTop: true,
                                //     enableDrag: true,
                                //     maxHeight: 1,
                                //     minHeight: 0.5);
                              },
                              child: Icon(
                                Icons.filter_list,
                                size: 26,
                              )
                                  .box
                                  .p4
                                  .border(color: ColorTheme.primaryColors[3])
                                  .make(),
                            ),
                            horSpacing5,
                            styleChip("Followers"),
                            horSpacing5,
                            styleChip("Followers"),
                            horSpacing5,
                            styleChip("Followers"),
                            horSpacing5,
                            styleChip("Followers"),
                            horSpacing5,
                            styleChip("Followers"),
                            horSpacing5,
                            styleChip("Followers"),
                            horSpacing5,
                            styleChip("Followers"),
                            horSpacing5,
                            styleChip("Followers"),
                            horSpacing5,
                          ],
                        ).scrollHorizontal(),
                      ),
                    ),
                    TabBar(tabs: [
                      Tab(
                        text: "All",
                      ),
                      Tab(
                        text: appName,
                      ),
                      Tab(
                        text: "Community",
                      )
                    ]),
                  ],
                ),
              ),
              Container(
                height: context.screenHeight * 0.8 -
                    70 -
                    context.mq.viewPadding.top,
                child: TabBarView(
                  children: [
                    FeedAll(),
                    FeedAll(),
                    FeedAll(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
