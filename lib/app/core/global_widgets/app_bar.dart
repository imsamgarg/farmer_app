import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    IconData? leadingIcon,
    VoidCallback? leadingPress,
    String? leadingTooltip,
    IconData? trailingIcon,
    bool automaticallyImplyLeading = false,
    VoidCallback? trailingPress,
    String? trailingTooltip,
    required String heading,
    PreferredSizeWidget? bottom,
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
              : null,
          title: heading.text.make(),
          bottom: bottom,
        );
}
