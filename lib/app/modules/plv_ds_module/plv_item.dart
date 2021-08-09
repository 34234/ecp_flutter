
import 'package:ecp_mobile/app/data/repository/plv_ds.dart';
import 'package:ecp_mobile/app/modules/main_module/main_controller.dart';
import 'package:ecp_mobile/app/modules/plv_ds_module/plv_ds_controller.dart';
import 'package:ecp_mobile/app/modules/plv_ds_module/plv_provider.dart';
import 'package:ecp_mobile/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class plv_item extends StatelessWidget{
  final Plv plv ;
  const plv_item({Key key, this.plv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final plv_dsController c = Get.find<plv_dsController>();
    return  Card(margin: EdgeInsets.all(10),
        shadowColor: Colors.redAccent,
        child: Slidable(
            key: const ValueKey(0),
            actionPane: SlidableDrawerActionPane(),
            actions: <Widget>[
              IconSlideAction(
                caption: 'Kết thúc',
                color: Colors.blue,
                icon: Icons.archive,
                foregroundColor: Colors.white,
                onTap: () {
                  Plv_provider p = Plv_provider();
                  p.sendKetThucCV(plv, (data) {
                    c.plvs.remove(plv);
                    c.update();
                  });
                },
              ),
              IconSlideAction(
                caption: 'Tọa độ',
                color: Colors.orangeAccent,
                icon: Icons.location_on,
                foregroundColor: Colors.white,
                onTap: () async {
                  String _url="geo:"+plv.viDo.toString() +","+plv.kinhDo.toString();
                  await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
                },
              ),
            ],
            child: ListTile(onTap: () async{ await c.showdetail(plv);  },
      title: Row(children: <Widget>[
        Text("Số phiếu: "+plv.maPct.toString() +" - "+ plv.tenphongban.toString(),style: TextStyle(fontWeight: FontWeight.w500),)
         ,Expanded(child: Container()),
        plv.trangThai==3?Icon(Icons.check,color: Colors.blueAccent,size: 14):Container()]),
      subtitle: Container(padding: EdgeInsets.only(top:5), child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text( plv.noiDung.trim(),overflow: TextOverflow.ellipsis,maxLines: 3,style: TextStyle(fontSize: 16),),
          SizedBox(width: 1,height: 5,),
          Row(
              children: <Widget>[
              Icon(Icons.location_on_outlined,color: Colors.orangeAccent,size: 14),
              Expanded(child: Text(plv.diaDiem.trim(),overflow: TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontSize: 14),)),],
                  ),
          SizedBox(width: 1,height: 5,),
          Row(
            children: <Widget>[
              Icon(Icons.person,color: Colors.orangeAccent,size: 14,),
              Text(plv.nguoiChiHuy,style:TextStyle(color: Colors.orangeAccent,fontSize: 14)),
              Spacer(),
              // Icon(Icons.pending_actions,color: Colors.blueAccent,),
              // Spacer(),
              Icon(Icons.calendar_today_sharp,color: Colors.orangeAccent,size: 14),
             Text(  DateFormat("dd/MM/yy hh:mm").format(DateTime.parse(plv.ngayLamViec)).toString(),
                 style:TextStyle(color: Colors.orangeAccent,fontSize: 14)),
            ],
          ),
        ],
      )),

    )));
  }
}