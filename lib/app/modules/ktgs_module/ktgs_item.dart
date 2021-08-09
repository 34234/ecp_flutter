
import 'package:ecp_mobile/app/data/repository/TblKTGS.dart';
import 'package:ecp_mobile/app/modules/ktgs_module/ktgs_controller.dart';
import 'package:ecp_mobile/app/utils/CameraUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ktgs_item extends StatelessWidget{
  final TblKtgs ktgs ;
  const ktgs_item({Key key, this.ktgs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ktgsController c = Get.find<ktgsController>();
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
                },
              ),
              // IconSlideAction(
              //   caption: 'Tọa độ',
              //   color: Colors.orangeAccent,
              //   icon: Icons.location_on,
              //   foregroundColor: Colors.white,
              //   onTap: () async {
              //    //showLocation(ktgs.ki, kinhdo)
              //   },
              // ),
            ],
            child: ListTile(onTap: () async{ await c.showdetail(ktgs);  },
              title: Row(children: <Widget>[
                Text("Biên bản kiểm tra đơn vị: "+ktgs.donViId.toString() ,style: TextStyle(fontWeight: FontWeight.w500),),
                Spacer(),
                ktgs.cotontai==true?Icon(Icons.warning_amber_rounded,color:Colors.redAccent):Container()
                ]),
              subtitle: Container(
                  padding: EdgeInsets.only(top:5), child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text( ktgs.noiDungCongViec,overflow: TextOverflow.ellipsis,maxLines: 3,style: TextStyle(fontSize: 16),),
                  SizedBox(width: 1,height: 5,),
                  Row(
                    children: <Widget>[
                      Icon(Icons.location_on_outlined,color: Colors.orangeAccent,size: 14),
                      Container(width: Get.width, child:Text(ktgs.diaDiem,overflow: TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontSize: 14),)),],
                  ),
                  SizedBox(width: 1,height: 5,),
                  Row(
                    children: <Widget>[
                      Icon(Icons.person,color: Colors.orangeAccent,size: 14,),
                      Text(ktgs.tpKt1==null?"":ktgs.tpKt1,style:TextStyle(color: Colors.orangeAccent,fontSize: 14)),
                      Spacer(),
                       // Icon(Icons.pending_actions,color: Colors.blueAccent,),
                       // Spacer(),
                      Icon(Icons.calendar_today_sharp,color: Colors.orangeAccent,size: 14),
                      Text(  ktgs.thoiGian_dis,
                          style:TextStyle(color: Colors.orangeAccent,fontSize: 14)),
                    ],
                  ),
                ],
              )),

            )));
  }
}