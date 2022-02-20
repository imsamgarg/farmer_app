import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/global_widgets/button.dart';
import 'package:farmer_app/app/core/values/values.dart';
import 'package:farmer_app/app/modules/crop_manual/controllers/crop_manual_controller.dart';
import 'package:farmer_app/assets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class GuideView extends GetView<CropManualController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              children: [
                verSpacing20,
                ClipRRect(
                  borderRadius: BorderRadius.circular(radius),
                  child: Container(
                    height: 230,
                    child: Image.asset(
                      Assets.to.diseaseFullPNG,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                verSpacing20,
                _CustomTile(title: "Title", value: "Dawney Mildew"),
                _CustomTile(title: "Category", value: "Crop Growth"),
                _CustomTile(title: "Crop Growth", value: "Vegatative"),
                _CustomTile(
                  title: "Action Step",
                  value: "Ridomil M Z; 3 g / l Or Unilax; 2.5g / Li",
                ),
                _CustomTile(title: "Disease / Pest", value: "Dawney Mildew"),
                _CustomTile(
                  title: "Disease / Pest",
                  value: "Tomato\nPotato\nCauliflower",
                ),
              ],
            ),
          ),
          verSpacing10,
          // CustomButton(
          //   child: "Next Information-Onion: Crop Growth".text.bold.make(),
          //   onPressed: controller.nextInfo,
          // ),
          verSpacing10,
        ],
      ),
    );
  }
}

class _CustomTile extends StatelessWidget {
  const _CustomTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: Row(
              children: [
                Expanded(child: title.text.sm.make().box.make()),
                Expanded(
                  child: value.text.bold.lineHeight(1.7).make().box.make(),
                ),
              ],
            ),
          ),
        ),
        Divider(
          thickness: 1,
          height: 10,
        ),
      ],
    );
  }
}
