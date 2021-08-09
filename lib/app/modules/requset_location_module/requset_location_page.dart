import 'package:ecp_mobile/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecp_mobile/app/modules/requset_location_module/requset_location_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class requsetLocationPage extends GetView<requsetLocationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:  Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Text("Thông báo",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.redAccent)),
          Text("Sử dụng định vị ",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.redAccent)),
          SizedBox(height: 10,),
          Text("Để xác định được chính xác vị trí ảnh chụp cho việc xác mính tính chính xác của bức ảnh để kiểm tra sau này. Cho phép ứng dụng ECP truy cập vị trí của bạn tại thời điểm này.",style: TextStyle(fontSize: 16)),
            Text("Thông tin định vị sẽ không sử dụng khi ứng dụng tắt",style: TextStyle(fontSize: 16)),
          Text("Thông tin định vị cũng sẽ không được chia sẻ cho bên thứ 3",style: TextStyle(fontSize: 16),),
          SizedBox(height: 10,),
          Image(image:  AssetImage(AppImage.pinmap),),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          TextButton(child: Text("Đồng ý",style: TextStyle(color:Colors.blueAccent,fontWeight:FontWeight.bold),),
            onPressed: (){controller.btn_Next_click();},
            ),
            // TextButton(child: Text("Từ trối",style: TextStyle(color:Colors.redAccent,fontWeight:FontWeight.bold),),
            //   onPressed: (){controller.btn_Cancel_click();},
            // )
          ],)
        ],),
      ),),
    );
  }
}
