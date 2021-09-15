import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

import 'package:farmer_app/app/core/utils/helper.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(
    String heading, {
    IconData? leadingIcon,
    VoidCallback? leadingPress,
    String? leadingTooltip,
    IconData? trailingIcon,
    bool automaticallyImplyLeading = false,
    VoidCallback? trailingPress,
    String? trailingTooltip,
    PreferredSizeWidget? bottom,
    List<Widget>? actions,
  }) : super(
          leading: IconButton(
            onPressed: leadingPress ?? goBack,
            icon: Icon(leadingIcon ?? Icons.arrow_back_ios_new_rounded),
            tooltip: leadingTooltip,
          ),
          centerTitle: true,
          automaticallyImplyLeading: automaticallyImplyLeading,
          actions: (trailingIcon != null)
              ? [
                  IconButton(
                    onPressed: trailingPress,
                    icon: Icon(trailingIcon),
                    tooltip: trailingTooltip,
                  )
                ]
              : actions,
          title: heading.text.bold.make(),
          bottom: bottom,
        );
}
