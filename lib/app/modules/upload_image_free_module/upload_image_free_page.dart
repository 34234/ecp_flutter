import 'package:ecp_mobile/ApiRequest/apirequest.dart';
import 'package:ecp_mobile/ApiRequest/globalData.dart';
import 'package:ecp_mobile/app/routes/app_pages.dart';
import 'package:ecp_mobile/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecp_mobile/app/modules/upload_image_free_module/upload_image_free_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class uploadImageFreePage extends GetView<uploadImageFreeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tải ảnh không theo phiên'),actions: [IconButton(icon:Icon(Icons.search),
      onPressed: (){Get.toNamed('SearchImage');},)],),
      body: Container(
        child:    GetBuilder<uploadImageFreeController>(
        //init: VbdiController(),
        builder: (controller) {
          return SingleChildScrollView(child:Container( 
            padding: EdgeInsets.all(10),
              width: Get.width, child:
          Column(
            children: [
              Row(
                //mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(icon: Icon(Icons.camera), onPressed: () {
                    controller.takeImage('c');
                  }),
                  SizedBox(width: 100,),
                  IconButton(
                      icon: Icon(Icons.picture_as_pdf_sharp), onPressed: () {
                    controller.takeImage('g');
                  })
                ],
              ),
              Divider(),
              Align(alignment: Alignment.centerLeft, child: Wrap(
                  runSpacing: 5,
                  spacing: 5,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  children: controller.lst.map((d) {
                    return GestureDetector(
                      onTap: () =>
                      {
                        Get.toNamed(Routes.IMAGE_VIEW_DETAIL, arguments: d,)
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        child: Hero(
                          tag: d.url,
                          child: Image.network(
                            ApiRequest.baseurl  +"Image/GetFileThump?path="+ d.url+"&MA_DVQL_CHA="+GlobalData.IDConnect,
                            // ApiRequest.baseurl +
                            //     "/ImagesPLV/Files_thumb/" + d.url,
                            errorBuilder: (context, error, stackTrace) {
                              return Image(
                                image: AssetImage(AppImage.img_notfound),);
                            },
                            loadingBuilder:
                                (context, child, process) {
                              return process == null
                                  ? child
                                  : Padding(
                                padding: EdgeInsets.all(30),
                                child:
                                CircularProgressIndicator(),
                              );
                            },
                            fit: BoxFit.fill,
                          ),),
                      ),);
                  }).toList()),)
            ],
          )));
        })),
    );
  }
}
