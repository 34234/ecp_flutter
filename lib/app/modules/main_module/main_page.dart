import 'package:ecp_mobile/ApiRequest/globalData.dart';
import 'package:ecp_mobile/app/data/repository/tblDonvi.dart';
import 'package:ecp_mobile/components/EText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecp_mobile/app/modules/main_module/main_controller.dart';
import 'package:ecp_mobile/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class mainPage extends GetView<mainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text(
              "Xin chào ${controller.tblNhanVien.value.chucVu} - ${controller.tblNhanVien.value.tenNhanVien}")),
        ),
        drawer: BuiltDraw(),
        body: SmartRefresher(
          enablePullDown: true,
          onRefresh: controller.onRefreshPullDown,
          controller: controller.refreshController,
          child: Builder(
              builder: (context) => Container(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.home_work_outlined,
                                color: Colors.orangeAccent),
                            Text(" Đơn vị để kiểm tra"),
                            SizedBox(
                              width: 10,
                            ),
                            Spacer(),
                            Obx(() => Text(
                                  controller.donvi_select.value.tenDonVi == null
                                      ? ""
                                      : controller.donvi_select.value.tenDonVi,
                                  style: TextStyle(fontSize: 12),
                                )),
                            //Text("${c.current_phongban.value.tenPb}"),
                            MakePopupDonVi(),
                          ],
                        ),
                      ),
                      CreateContentMenuParent(
                          "Phiên làm việc", Icons.note_outlined),
                      GestureDetector(
                        onTap: () {
                          controller.gotoplvds_dlv();
                        },
                        child: CreateContentMenuChild(
                            "Đang thực hiện",
                            Icons.hardware,
                            Obx(() => Text(
                                  controller.count.value.PLV_Dang_Thuc_hien
                                      .toString(),
                                  style: TextStyle(color: Colors.white),
                                )),
                            null,
                            colorIcon: Colors.redAccent),
                      ),
                      GestureDetector(
                        onTap: () {
                        controller.gotoplvds_cth();
                        },
                        child: CreateContentMenuChild(
                            "Chưa thực hiện",
                            Icons.handyman,
                            Obx(() => Text(
                                  controller.count.value.PLV_Chua_Thuc_hien
                                      .toString(),
                                  style: TextStyle(color: Colors.white),
                                )),
                            null,
                            colorIcon: Colors.orangeAccent),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.gotoplvds_dkt();
                        },
                        child: CreateContentMenuChild(
                            "Đã hoàn thành", null, null, null,
                            colorIcon: Colors.blueAccent),
                      ),
                      Visibility(
                        child: GestureDetector(
                          onTap: () {

                          },
                          child: CreateContentMenuParent(
                              "Quản lý hình ảnh", Icons.photo),
                        ),
                        visible: !GlobalData.KTGS,
                      ),
                      Visibility(
                          visible: !GlobalData.KTGS,
                          child: CreateContentMenuChild(
                              "Ảnh chưa phân loại",
                              CupertinoIcons.lessthan,
                              Text(
                                "",
                                style: TextStyle(color: Colors.white),
                              ),
                              null,
                              colorIcon: Colors.redAccent)),
                      Visibility(
                        visible: !GlobalData.KTGS,
                        child: GestureDetector(
                          onTap: () {
                           controller.gotoPageUploadImageFree();
                          },
                          child: CreateContentMenuChild(
                              "Tải ảnh không theo phiên",
                              Icons.camera,
                              Text(
                                "",
                                style: TextStyle(color: Colors.white),
                              ),
                              null,
                              colorIcon: Colors.redAccent),
                        ),
                      ),
                      Visibility(
                          visible: GlobalData.KTGS, child:Column(children: [
                      CreateContentMenuParent(
                          "Quản lý phiên kiểm tra hiện trường",
                          Icons.note_outlined),
                      GestureDetector(
                        onTap: () {
                          controller.gotoPageKTGS();
                        },
                        child: CreateContentMenuChild(
                            "Biên bản đã thực hiện",
                            Icons.accessibility,
                            Obx(() => Text(
                                  controller.count.value.ktgs_kt.toString(),
                                  style: TextStyle(color: Colors.white),
                                )),
                            null,
                            colorIcon: Colors.redAccent),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.gotoPagektgs_dth();
                        },
                        child: CreateContentMenuChild(
                            "Biên bản chưa kết thúc",
                            Icons.accessibility,
                            Obx(() => Text(
                                  controller.count.value.ktgs_ckt.toString(),
                                  style: TextStyle(color: Colors.white),
                                )),
                            null,
                            colorIcon: Colors.redAccent),
                      ),
                      GestureDetector(
                        onTap: () {
                              controller.Taobbktgscs();
                        },
                        child: CreateContentMenuChild(
                            "Tạo biên bản kiểm tra đột xuất cơ sở",
                            Icons.accessibility,
                             null,
                             null,
                            colorIcon: Colors.redAccent),
                      )],)),
                    ],
                  ))),
        ));
  }
}

Widget MakePopupDonVi() {
  //homeController c = Get.find();
  mainController c = Get.find();
  if (c.tblDonVis.length <= 1) return Container();
  return PopupMenuButton(
    onSelected: (e) => {c.Popselect(e)},
    itemBuilder: (context) {
      List<PopupMenuEntry<Object>> list = [];
      for (var i in c.tblDonVis) {
        list.add(PopupMenuItem<TblDonVi>(
          value: i,
          child: Row(
            children: [
              if (c.donvi_select.value == i) Icon(Icons.check),
              Text(
                i.tenDonVi,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ));
      }
      return list;
    },
  );
}

Widget CreateContentMenuParent(String noidung, IconData icon) {
  return Container(
    decoration: BoxDecoration(color: Colors.black12),
    padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.redAccent,
        ),
        Text(
          noidung,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget CreateContentMenuChild(
    String noidung, IconData icon, Widget number, Function f,
    {Color colorIcon: Colors.blueAccent}) {
  return InkWell(
      highlightColor: Colors.red,
      onTap: f,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.black12))),
        padding: EdgeInsets.only(left: 25, top: 10, bottom: 10, right: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: colorIcon,
            ),
            Text(noidung),
            Spacer(),
            if (number != null)
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: colorIcon),
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                  child: number),
            //Text(count.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),)
          ],
        ),
      ));
}
