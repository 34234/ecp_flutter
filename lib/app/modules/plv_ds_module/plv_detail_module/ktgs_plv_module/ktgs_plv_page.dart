import 'package:ecp_mobile/ApiRequest/apirequest.dart';
import 'package:ecp_mobile/ApiRequest/globalData.dart';
import 'package:ecp_mobile/app/data/repository/TblKTGS.dart';
import 'package:ecp_mobile/app/modules/plv_ds_module/plv_detail_module/ktgs_plv_module/ktgs_plv_controller.dart';
import 'package:ecp_mobile/app/routes/app_pages.dart';
import 'package:ecp_mobile/app/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ktgs_plvPage extends GetView<ktgs_plvController> {

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          // floatingActionButton: IconButton(icon:Icon(Icons.save),onPressed: (){
          //   Get.snackbar("Thông báo", "Dữ liệu đã cập nhật");
          // },),
          backgroundColor: Colors.white,
          appBar: AppBar(
              title: Text("Biên bản kiểm tra "),
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.list),
                    text: "Thông tin biên bản", ),
                  Tab(icon: Icon(Icons.photo), text: "Ảnh biên bản"),
                ],
              )),
          body: TabBarView(
            children: [
              //Center(child: Text('hello'),),
              buildTongTinKTGS(controller.ktgs.value),

              //Icon(Icons.directions_car),
              buildTongTinAnhKTGS(controller.ktgs.value),
            ],
          ),
        ));;
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
  BuiltListTile2(String tieude, Widget infor, IconData i) {
    return ListTile(
      title: Text(
        tieude,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      // contentPadding: EdgeInsets.all(5),
      subtitle: infor,
      leading: Icon(
        i,
        color: Colors.orangeAccent,
      ),
    );
  }

  Widget buildTongTinKTGS(TblKtgs p) {
    bool loai_ktplv= controller.ktgs.value.loaiktgs=="KTPLV";

    return Container(

        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuiltListTile(
                  "Thời gian:",p.thoiGian==null?"": p.thoiGian, Icons.note_outlined),
              Divider(
                color: Colors.orangeAccent,
              ),
              Visibility(
                  visible: loai_ktplv,
                  child:BuiltListTile(
                  "Địa điểm tại:",p.diaDiem==null?"": p.diaDiem, Icons.location_on)),
          Visibility(
              visible: loai_ktplv,
              child: Divider(
                color: Colors.orangeAccent,
              )),
              BuiltListTile("Đơn vị cơ sở",p.donViId==null?"": p.donViId, Icons.location_on_outlined),
              Divider(
                color: Colors.orangeAccent,
              ),
              BuiltListTile2(
                  "Thành phần đoàn kiểm tra:",
                  Container(
                      width: Get.width,
                      child:Column( crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text("Người thứ 1"),
                      CupertinoTextField(controller: controller.txtTP1,),
                      //Text("Chức vụ"),
                      SizedBox(height: 10,),
                      Text("Người thứ 2"),
                      CupertinoTextField(controller: controller.txtTP2),
                      //Text("Chức vụ"),
                  ],)),
                  Icons.admin_panel_settings),
              Divider(
                color: Colors.orangeAccent,
              ),
              BuiltListTile2(
                  "Thành phần đoàn kiểm tra cơ sở:",
                  Container(
                      width: Get.width,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Người thứ 1"),
                        CupertinoTextField(controller: controller.txtTP_CS1),
                          SizedBox(height: 10,),
                          Text("Người thứ 2"),
                        CupertinoTextField(controller: controller.txtTP_CS2),

                      ],)),
                  Icons.admin_panel_settings),
              Divider(
                color: Colors.orangeAccent,
              ),
              Visibility(
                visible: loai_ktplv,
                  child:
              BuiltListTile2(
                  "Đơn vị được kiểm tra:",
                  Container(
                      width: Get.width,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Text("Người chỉ huy trực tiếp:" +(controller.ktgs.value.nguoiChiHuyTt==null?"":controller.ktgs.value.nguoiChiHuyTt)),

                        //CupertinoTextField(),
                        SizedBox(height: 10,),
                        Text("Người giám sát an toàn điện"),
                          CupertinoTextField(controller: controller.txtTP_GSD),
                        //CupertinoTextField(),
                      ],)),
                  Icons.admin_panel_settings)),
             Container(
               color:Colors.black12,
                 padding: EdgeInsets.all(10),
                 child: Align(alignment: Alignment.center, child:  Text("Đánh giá nhận xét",style: TextStyle(fontSize: 20, color: Colors.redAccent,fontWeight: FontWeight.bold),),)),
              BuiltListTile2(
                (loai_ktplv==true?
                  "1. Phổ biến, hướng dẫn các biện pháp an toàn, trình tự thực hiện công việc và giám sát an toàn cho đơn vị công tác ngay tại hiện trường làm việc:"
                  :
                 "1. Giao ban an toàn tuần, đầu ngày và trước khi ra hiện trường công tác:"),
                  Container(
                      child:   CupertinoTextField(controller:controller.txtY1,
                        keyboardType: TextInputType.multiline, maxLines: null,),
                       ),
                  Icons.pending_actions),
              Divider(
                color: Colors.orangeAccent,
              ),
              BuiltListTile2(
                (loai_ktplv==true?
                 "2. Sử dụng bảo quản phương tiện bảo vệ cá nhân, dụng cụ an toàn, dung cụ phương tiện thi công:"
                  :
                  "2. Công tác KTKS an toàn lao động của cán bộ quản lý:"),
                  Container(
                    child:   CupertinoTextField(
                      controller:controller.txtY2,
                      keyboardType: TextInputType.multiline, maxLines: null,),
                  ),
                  Icons.pending_actions),
              Divider(
                color: Colors.orangeAccent,
              ),
              BuiltListTile2(
                (loai_ktplv==true?
                  "3. Thực hiện phiếu công tác, lệnh công tác, phiếu thao tác:"
                    :
                    "3. Công tác quản lý người lao động:"),
                  Container(
                    child:   CupertinoTextField(
                      controller: controller.txtY3,
                      keyboardType: TextInputType.multiline, maxLines: null,
                    ),
                  ),
                  Icons.pending_actions),
              Divider(
                color: Colors.orangeAccent,
              ),
              BuiltListTile2(
                (loai_ktplv==true?
                  "4. Thực hiện các biện pháp an toàn và biện pháp thi công:"
                    :"4. Công tác quản lý phương tiện bảo vệ cá nhân, dụng cụ an toàn, dung cụ phương tiện thi công:"),
                  Container(
                    child:   CupertinoTextField(
                      controller: controller.txtY4,
                      keyboardType: TextInputType.multiline, maxLines: null,
                    ),
                  ),
                  Icons.pending_actions),
              Divider(
                color: Colors.orangeAccent,
              ),
              BuiltListTile2(
                (loai_ktplv==true?
                  "5. Kiến nghị của đoàn kiểm tra:"
                    :"5. Công tác quản lý phiếu công tác, lệnh công tác, phiếu thao tác:"),
                  Container( 
                    child:  Column(
                      children: [
                        Visibility(
                          visible:loai_ktplv ,
                            child:
                        Row(children: [
                          Spacer(),
                          Text("Còn tồn tại",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.redAccent),),
                          Obx(()=>GestureDetector(child:
                          CupertinoSwitch(value: controller.istontai.value,
                          onChanged: (b){
                            controller.istontai.value=b;
                          },),
                          onTap: (){
                            controller.istontai.value=!controller.istontai.value;
                          },
                          )),
                        ],)),
                          CupertinoTextField(
                            controller: controller.txtY5,
                            keyboardType: TextInputType.multiline, maxLines: null,
                          ),
                    ],)
                  ),
                  Icons.pending_actions),
              Divider(
                color: Colors.orangeAccent,
              ),
              BuiltListTile2(
                (loai_ktplv==true?
                  "6. Ý kiến của người chỉ huy trực tiếp đơn vị công tác:"
                    :"6. Công tác điều hành của TVH:"),
                  Container(
                    child:   CupertinoTextField(
                      controller: controller.txtY6,
                      keyboardType: TextInputType.multiline, maxLines: null,
                    ),
                  ),
                  Icons.pending_actions),
              Divider(
                color: Colors.orangeAccent,
              ),
              BuiltListTile2(
                (loai_ktplv==true?
                  "7. Ý kiến của đơn vị(Cơ sở) được kiểm tra:"
                    :"7. Nội dung khác:"),
                  Container(
                    child:   CupertinoTextField(
                      controller: controller.txtY7,
                      keyboardType: TextInputType.multiline, maxLines: null,
                    ),
                  ),
                  Icons.pending_actions),
              Divider(
                color: Colors.orangeAccent,
              ),
              Visibility(
                  visible: !loai_ktplv,
                  child: Column(
                children: [
                  Row(children: [
                    Spacer(),
                    Text("Còn tồn tại",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.redAccent),),
                    Obx(()=>GestureDetector(child:
                    CupertinoSwitch(value: controller.istontai.value,
                      onChanged: (b){
                        controller.istontai.value=b;
                      },),
                      onTap: (){
                        controller.istontai.value=!controller.istontai.value;
                      },
                    )),
                  ],),
              BuiltListTile2(
                  "8. Kiến nghị của đoàn kiểm tra: (Giai thích: Có tồn tại thì đoàn Ktra tích vào ô đó – phục vụ thống kê sau này).",
                  Container(
                    child:   CupertinoTextField(
                      controller: controller.txtY8,
                      keyboardType: TextInputType.multiline, maxLines: null,
                    ),
                  ),
                  Icons.pending_actions),
                  Divider(
                    color: Colors.orangeAccent,
                  ),
                  BuiltListTile2(
                      "9. Ý kiến của đơn vị(Cơ sở) được kiểm tra:",
                      Container(
                        child:   CupertinoTextField(
                          controller: controller.txtY9,
                          keyboardType: TextInputType.multiline, maxLines: null,
                        ),
                      ),
                      Icons.pending_actions),
                  Divider(
                    color: Colors.orangeAccent,
                  ),
              ],)),
              Container(
                padding: EdgeInsets.all(10),
                child:Text("Đoàn kiểm tra chịu trách nhiệm hoàn toàn về các ý kiến của đoàn được ghi trong biên bản"
                    ,style: TextStyle(color: Colors.red, fontSize: 18)
                ),),
              Container(
                padding: EdgeInsets.all(10),
               child: Text("YÊU CẦU CẬP NHẬP HÌNH ẢNH BIÊN BẢN, ĐOÀN KIỂM TRA...SAU ĐÓ ẤN LƯU"
                 ,style: TextStyle( fontSize: 18),),
              ),
            ],
          ),
        ));
  }

  buildTongTinAnhKTGS(TblKtgs p){
   return SingleChildScrollView(child:
   GetBuilder<ktgs_plvController>(
     //init: VbdiController(),
       builder: (controller)
   {
     return
       Container(
           padding: EdgeInsets.all(10),
           width: Get.width, child:
       Column(
         children: [
           Row(
             //mainAxisSize: MainAxisSize.max,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Camera"),
               IconButton(icon: Icon(Icons.camera), onPressed: () {
                 controller.takeImage('c');
               }),
               SizedBox(width: 100,),
               Text("Thư viện"),
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
               children: controller.lstimg.map((d) {
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
               }).toList()),),
           MaterialButton(
               splashColor: Colors.black12,
               color: Colors.blueAccent,
               onPressed: (){controller.sendKetThucBBKT();},
               child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Icon(
                         CupertinoIcons.check_mark,
                         color: Colors.white),
                     SizedBox(width: 5,),
                     Text("Kết thúc biên bản",style: TextStyle(color: Colors.white),),
                   ])
           )
         ],
       ));
   }
    ));
  }
}
