import 'package:ecp_mobile/ApiRequest/apirequest.dart';
import 'package:ecp_mobile/ApiRequest/globalData.dart';
import 'package:ecp_mobile/app/data/repository/plv_ds.dart';
import 'package:get/get.dart';


class Plv_provider{

  sendKetThucCV(Plv p, Function(dynamic data) onSuccess){
    String url="PLV/KetThucPLV";
    var para= {
      "IDConect":GlobalData.IDConnect,
      "IdPhien":p.id,
      "username":GlobalData.tblNhanVien.username,
    };
    ApiRequest(url:url,para: para).get(onSuccess: (d)
    async {
      Get.snackbar('Thông báo', 'Kết thúc thành công');
      onSuccess(d);
      //await Get.back(result: "delete");
      //this.ims.value.
    });

  }

}