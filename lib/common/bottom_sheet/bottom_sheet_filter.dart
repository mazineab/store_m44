import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_m44/common/bottom_sheet/bottom_sheet_filter_controller.dart';

class BottomSheetFilter extends StatelessWidget {
  const BottomSheetFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomSheetFilterController>(
      init: BottomSheetFilterController(),
      builder: (controller)=> Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              title: Text('Brand name'),
              value: 'Brand name',
              groupValue: controller.selectedOtion.value,
              onChanged: (value) {
                controller.chnage(value!);
                print(controller.selectedOtion.value);
              },

            ),
            RadioListTile<String>(
              title: Text('Description'),
              value: 'Description',
              groupValue:controller.selectedOtion.value,
              onChanged: (value) {
                controller.chnage(value!);
                print(controller.selectedOtion.value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
