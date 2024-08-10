import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_m44/common/bottom_sheet/bottom_sheet_filter_controller.dart';
import 'package:store_m44/core/utils/constant.dart';

class BottomSheetFilter extends StatelessWidget {
  const BottomSheetFilter({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomSheetFilterController>(
      init: BottomSheetFilterController(),
      builder: (controller)=> Container(
        padding: EdgeInsets.all(16),
        child: SizedBox(
          height: 300,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textTitle("search by"),
                RadioListTile<String>(
                  title: Text('Brand name'),
                  value: 'Brand name',
                  groupValue: controller.selectSearch.value,
                  onChanged: (value) =>controller.chnageSearch(value!)

                ),
                RadioListTile<String>(
                  title: Text('Description'),
                  value: 'Description',
                  groupValue:controller.selectSearch.value,
                  onChanged: (value) =>controller.chnageSearch(value!)
                ),
                RadioListTile<String>(
                  title: Text('Price'),
                    value: 'Price',
                    groupValue: controller.selectSearch.value,
                    onChanged:(value) =>controller.chnageSearch(value!)
                ),
                textTitle("Category"),const SizedBox(height:10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal:10),
                  width: double.infinity,
                  height: 50,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                      )
                    ),
                    hint: Text("All"==controller.category.value?"All":controller.category.value),
                      items: Constant.list.map((e){
                        return DropdownMenuItem(
                            value: e,
                            child:Text(e)
                        );
                      }).toList(),
                      onChanged: (val){
                        controller.category.value=val!;
                        print(controller.category.value);
                      }
                  ),
                ),
                const SizedBox(height:10),
                textTitle("Sort by"),
                RadioListTile(
                    title: Text("Default"),
                    value: "Default",
                    groupValue: controller.selectSort.value,
                    onChanged: (value)=>controller.changeSort(value!)
                ),
                RadioListTile<String>(
                  title: Text('Price'),
                  value: 'Price',
                  groupValue:controller.selectSort.value,
                  onChanged: (value)=>controller.changeSort(value!)
                ),
                RadioListTile<String>(
                  title: Text('Description'),
                  value: 'Description',
                  groupValue:controller.selectSort.value,
                  onChanged: (value) {
                    controller.changeSort(value!);
                  },
                ),
                RadioListTile<String>(
                  title: Text('Brand name'),
                  value: 'Brand name',
                  groupValue:controller.selectSort.value,
                  onChanged: (value)=>controller.changeSort(value!)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget textTitle(String title){
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(title,style: const TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.grey),),
    );
  }
}
