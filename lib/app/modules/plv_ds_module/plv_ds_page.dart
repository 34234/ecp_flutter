import 'package:ecp_mobile/app/modules/plv_ds_module/plv_item.dart';
import 'package:ecp_mobile/components/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecp_mobile/app/modules/plv_ds_module/plv_ds_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class plv_dsPage extends GetView<plv_dsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Obx(()=>Text('Phiên '+controller.tille.value)),actions: [
        IconButton(icon: Icon(Icons.search), onPressed: (){
          controller.showSearch();

        })
      ],),
      body: Container(child: GetBuilder<plv_dsController>(
        //init: VbdiController(),
        builder: (controller) {
          return
              Column(children: [
                Obx(()=> Visibility(child: CircularProgressIndicator(),visible: controller.isLoading.value,)),
                Container(padding: EdgeInsets.all(5),
                    child:Align( alignment: Alignment.centerRight,child: Text("Tổng số bản ghi: "+controller.count.value.toString(),style: TextStyle(color: Colors.black54),))),
                Expanded(child: ListView.builder(
                  itemCount: controller.plvs.length,
                  controller: controller.controller,
                  itemBuilder: (context, index) =>
                  plv_item(plv: controller.plvs[index],)
                )),]
              );
        },
      ),
    ),);
  }


}
