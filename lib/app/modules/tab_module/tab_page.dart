import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecp_mobile/app/modules/tab_module/tab_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class tabPage extends GetView<tabController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('tab Page')),
      body: Container(
        child: Obx(()=>Container(child: Text(controller.obj),)),
      ),
    );
  }
}
