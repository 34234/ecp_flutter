

import 'package:ecp_mobile/ApiRequest/apirequest.dart';
import 'package:ecp_mobile/ApiRequest/globalData.dart';
import 'package:ecp_mobile/app/data/repository/plv_ds.dart';
import 'package:ecp_mobile/app/data/repository/tblGroupImage.dart';
import 'package:ecp_mobile/app/modules/plv_ds_module/plv_detail_module/plv_detail_controller.dart';
import 'package:ecp_mobile/app/modules/plv_ds_module/plv_ds_controller.dart';
import 'package:ecp_mobile/app/routes/app_pages.dart';
import 'package:ecp_mobile/app/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class plv_detailPage extends GetView<plv_detailController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              //title: Text("Phiên làm việc số " + controller.plv.value.maPct.toString()),
              actions: [controller.taophieukt(),],
              bottom: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.list),
                    text: "Thông tin phiên làm việc",
                  ),
                  Tab(icon: Icon(Icons.photo), text: "Ảnh phiên làm việc"),
                ],
              )),
          body: TabBarView(
            children: [
              buildTongTinPhieu(controller.plv.value),
              //Icon(Icons.directions_car),
              buildTongTinAnh(controller.plv.value),
            ],
          ),
        ));
  }

  Widget buildTongTinPhieu(Plv p) {
    return Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuiltListTile(
                  "Nội dung thực hiện", p.noiDung, Icons.note_outlined),
              Divider(
                color: Colors.orangeAccent,
              ),
              BuiltListTile("Địa điểm", p.diaDiem, Icons.location_on_outlined),
              Divider(
                color: Colors.orangeAccent,
              ),
              BuiltListTile(
                  "Điều kiện an toàn",
                  p.dieuKienAnToan == null ? "Không có" : p.dieuKienAnToan,
                  Icons.admin_panel_settings),
              Divider(
                color: Colors.orangeAccent,
              ),
              BuiltListTile("Thời gian thực hiện",
                  p.strgioBd + " - " + p.strgioKt, Icons.timelapse),
              Divider(
                color: Colors.orangeAccent,
              ),
              BuiltListTile("Người duyệt", p.nguoiDuyet,
                  CupertinoIcons.person_crop_circle_fill_badge_checkmark),
              Divider(
                color: Colors.orangeAccent,
              ),
               BuiltListTile("Chỉ huy", p.nguoiChiHuy, CupertinoIcons.pencil),
              Divider(
                color: Colors.orangeAccent,
              ),
               BuiltListTile("Người cho phép an toàn", p.nguoiKiemSoat,
                   CupertinoIcons.hand_raised_fill),
              Divider(
                color: Colors.orangeAccent,
              ),
              BuiltListTile(
                  "Tình trạng",
                  p.trangThai == 3 ? "Hoàn thành" : "Đang thực hiện",
                  CupertinoIcons.star),
              Divider(
                color: Colors.orangeAccent,
              ),

            ],
          ),
        ));
  }

  BuiltListTile(String tieude, String infor, IconData i) {
    return ListTile(
      title: Text(
        tieude,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      // contentPadding: EdgeInsets.all(5),
      subtitle: Text(infor),
      leading: Icon(
        i,
        color: Colors.orangeAccent,
      ),
    );
  }

  Widget buildTongTinAnh(Plv p) {
    return Container(
        padding: EdgeInsets.all(10),
        child: GetBuilder<plv_detailController>(
            //init: VbdiController(),
            builder: (controller) {
          return SingleChildScrollView(
              child: Column(
            children: <Widget>[
              // controller.image==null?Text("no image select"):
              // Image.file(controller.image),
              Row(
                children: [
                  Text(
                    "Danh sách ảnh",
                    style: TextStyle(fontSize: 18),
                  ),
                  Expanded(child: Text('')),
                  Text("Xem theo nhóm",
                      style: TextStyle(fontSize: 18, color: Colors.black26)),
                  Obx(() => Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () => controller.changeView(),
                          tooltip: "Xem ảnh theo nhóm",
                          splashColor: Colors.black12,
                          icon: Icon(Icons.dashboard_rounded,
                              color: controller.view_type.value == "g"
                                  ? Colors.redAccent
                                  : Colors.black38)))),
                ],
              ),
              Visibility(
                  visible: controller.view_type.value == "g",
                  child: Column(
                    children: controller.group_img.value
                        .map((e) => Container(
                                child: Column(children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Row(children: [
                                  Text(e.noiDung,
                                      style: TextStyle(
                                          color: Colors.lightBlue,
                                          fontWeight: FontWeight.bold)),
                                  Expanded(
                                    child: Text(''),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                        CupertinoIcons.camera_on_rectangle,
                                        color: Colors.redAccent),
                                    splashColor: Colors.black12,
                                    onPressed: () {controller.showOption(e.id);},
                                  )
                                ]),
                              ),
                                  //     {
                                  //   return Text('');
                                  // }
                              BImageGroup(e),
                              Divider(
                                color: Colors.orangeAccent,
                              ),
                            ])))
                        .toList(),
                  )),
              Visibility(
                  visible: controller.view_type.value != "g",
                  child: Column(children: [
                    Row(children: [
                      Text("Xem ảnh không theo nhóm",
                          style: TextStyle(
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold)),
                      Expanded(
                        child: Text(''),
                      ),
                      IconButton(
                        icon: Icon(
                            CupertinoIcons.camera_on_rectangle,
                            color: Colors.redAccent),
                        splashColor: Colors.black12,
                        onPressed: () {controller.showOption(GroupImage.KHONG_XAC_DINH);},
                      )
                    ]),
                    Wrap(
                        runSpacing: 5,
                        spacing: 5,
                        children: controller.imgs.value
                            .map((d) =>GestureDetector(
                            onTap: ()=>{Get.toNamed(Routes.IMAGE_VIEW_DETAIL,arguments: d,) },
                            child:  Container(
                                  height: 80,
                                  width: 80,
                                  child:Hero(
                                    tag:d.url,
                                    child:  Image.network(
                                      ApiRequest.baseurl  +"Image/GetFileThump?path="+ d.url+"&MA_DVQL_CHA="+GlobalData.IDConnect,
                                    errorBuilder:  (context, error, stackTrace){
                                      return Image(image: AssetImage(AppImage.img_notfound),);
                                    },
                                    loadingBuilder: (context, child, process) {
                                      return process == null
                                          ? child
                                          : Padding(
                                              padding: EdgeInsets.all(30),
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                    },
                                    fit: BoxFit.cover,
                                  ),),
                                )))
                            .toList()),
                  ])),
              // kết thúc côgn việc
              Visibility(visible: controller.plv.value.trangThai != 3, child:MaterialButton(
                  splashColor: Colors.black12,
                  color: Colors.blueAccent,
                  onPressed: (){controller.sendKetThucCV();},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                            CupertinoIcons.check_mark,
                            color: Colors.white),
                        SizedBox(width: 5,),
                        Text("Kết thúc công việc",style: TextStyle(color: Colors.white),),
                      ])
              )),
              // TextButton(onPressed: () async {
              //   String urrl=Get.currentRoute;//(Routes.MAIN, (route) => true);
              //
              //   while(Routes.MAIN!=Get.currentRoute) {
              //     await Get.back();
              //   }
              //
              // }, child:Text("go home") )
            ],
          ));
        }));
  }

  BImageGroup(dynamic g ){
    var lst = controller.imgs.value.where((e) => g.id==e.groupId);
    if(lst.length<=0)
      return Container();
    else
    return Align(alignment: Alignment.centerLeft, child:  Wrap(
        runSpacing: 5,
        spacing: 5,
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        children:lst.map((d) {
            return GestureDetector(
              onTap: ()=>{Get.toNamed(Routes.IMAGE_VIEW_DETAIL,arguments: d,) },
              child:  Container(
              height: 80,
              width: 80,
              child: Hero(
                tag: d.url,
                child:  Image.network(
                  ApiRequest.baseurl  +"Image/GetFileThump?path="+ d.url+"&MA_DVQL_CHA="+GlobalData.IDConnect,
                errorBuilder:  (context, error, stackTrace){
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
                fit: BoxFit.fill,
              ),),
            ),);
        }).toList()),);
  }
}
