// import 'package:ecp_mobile/ApiRequest/apirequest.dart';
// import 'package:ecp_mobile/app/theme/app_theme.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'image_view_detail_controller.dart';
//
// /**
//  * GetX Template Generator - fb.com/htngu.99
//  * */
//
// class ImageViewDetailPage extends GetView<ImageViewDetailController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: Get.size.height,
//         width:  Get.size.width,
//         child: Column(children: [
//         Stack(
//
//             children: [
//         Hero(tag: controller.img.url,
//             child:InteractiveViewer(
//                 child:   Image.network(
//               ApiRequest.Baseurl_image+"/ImagesPLV/Files/"+controller.img.url,
//               errorBuilder:  (context, error, stackTrace){
//                 return Image(image: AssetImage(AppImage.img_notfound),);
//               },
//               loadingBuilder:
//                   (context, child, process) {
//                 return process == null
//                     ? child
//                     : Padding(
//                   padding: EdgeInsets.all(30),
//                   child:
//                   CircularProgressIndicator(),
//                 );
//               },
//               fit: BoxFit.cover,
//             )),
//         ),
//         Positioned(
//              top: 0,
//             left: 0,
//             child: Container(
//               padding: EdgeInsets.all(10),
//               width: Get.size.width,
//                 child: Row(children: [
//               IconButton(
//                 onPressed: (){
//                   Get.back();
//                   print('action');},
//                 splashColor: Colors.black12,
//                 icon: Icon(Icons.arrow_back,color: Colors.white),),
//               Expanded(child: Container(),),
//               IconButton(
//                 onPressed: (){},
//                 icon: Icon(Icons.message,color: Colors.white),),
//               IconButton(
//                 onPressed: (){},
//                 icon: Icon(Icons.restore_from_trash,color: Colors.white),),
//             ],))),
//         ]),
//           // Positioned(
//           //     bottom: 0,
//           //     left: 0,
//           //     child: Container(
//           //         padding: EdgeInsets.all(10),
//           //         width: Get.size.width,
//           //         child: Row(children: [
//           //           IconButton(
//           //             onPressed: (){
//           //               Get.back();
//           //               print('action');},
//           //             splashColor: Colors.black12,
//           //             icon: Icon(Icons.arrow_back,color: Colors.black12),),
//           //           Expanded(child: Container(),),
//           //           IconButton(
//           //             onPressed: (){},
//           //             icon: Icon(Icons.message,color: Colors.white),),
//           //           IconButton(
//           //             onPressed: (){},
//           //             icon: Icon(Icons.restore_from_trash,color: Colors.white),),
//           //         ],))),
//         ],)
//       ),
//     );
//   }
// }


import 'package:ecp_mobile/ApiRequest/apirequest.dart';
import 'package:ecp_mobile/ApiRequest/globalData.dart';
import 'package:ecp_mobile/app/theme/app_theme.dart';
import 'package:ecp_mobile/app/utils/CameraUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'image_view_detail_controller.dart';

/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ImageViewDetailPage extends GetView<ImageViewDetailController> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        drawer: builtDrawChat(),
        body: Stack(children: [
          Container(
            height: Get.size.height,
            width: Get.size.width,
            child:
            Hero(tag: controller.img.url,
              child: InteractiveViewer(
                maxScale:6 ,
                  child: Image.network(
                    ApiRequest.baseurl  +"Image/GetFile?path="+ controller.img.url+"&MA_DVQL_CHA="+GlobalData.IDConnect,
                    errorBuilder: (context, error, stackTrace) {
                      return Image(image: AssetImage(AppImage.img_notfound),);
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
                    fit: BoxFit.contain,
                  )),
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              child: SafeArea(child:Container(
                  padding: EdgeInsets.all(15),
                  width: Get.size.width,
                  child: Row(children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                        print('action');
                      },
                      splashColor: Colors.black12,
                      icon: Icon(
                          Icons.arrow_back, color: Colors.orangeAccent),),
                    Expanded(child: Container(),),
                    IconButton(
                      onPressed: () {
                        showLocation(controller.img.viDo,controller.img.kinhDo);
                      },
                      icon: Icon(Icons.location_on_outlined, color: Colors.orangeAccent),),
                    IconButton(
                      onPressed: () {
                        controller.showBottomSheetChat();
                        },
                      icon: Icon(Icons.message, color: Colors.orangeAccent),),
                    IconButton(
                      onPressed: () {controller.deleteImage();},
                      icon: Icon(Icons.restore_from_trash,
                          color: Colors.orangeAccent),),
                  ],)))),
        ],
        )
    );
  }

  Widget builtDrawChat() {
    return Drawer(
      child: Text('a')
      // ListView(
      //   padding: EdgeInsets.zero,
      //   children: controller.img.tblCommentImage.map((e) => Text(e.username)).toList(),
      // ),
    );
  }
}

