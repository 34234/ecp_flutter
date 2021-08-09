import 'package:ecp_mobile/app/modules/ktgs_module/ktgs_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecp_mobile/app/modules/ktgs_module/ktgs_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ktgsPage extends GetView<ktgsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('Biên bản kiểm tra'),actions: [
        IconButton(icon: Icon(Icons.search), onPressed: (){
          controller.showSearch();

        })
      ],),
      body: Container(child: GetBuilder<ktgsController>(
        //init: VbdiController(),
        builder: (controller) {
          return
            Column(children: [
              Obx(()=> Visibility(child: CircularProgressIndicator(),visible: controller.isLoading.value,)),
              Container(padding: EdgeInsets.all(5),
                  child:Align( alignment: Alignment.centerRight,child: Text("Tổng số bản ghi: "+controller.count.value.toString(),style: TextStyle(color: Colors.black54),))),
              Expanded(child: ListView.builder(
                  itemCount: controller.ktgs.length,
                  controller: controller.controller,
                  itemBuilder: (context, index) =>
                      ktgs_item(ktgs: controller.ktgs[index],)
              )),]
            );
        },
      ),
      ),);
  }
}
