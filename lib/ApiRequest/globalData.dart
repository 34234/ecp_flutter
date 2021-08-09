import 'package:ecp_mobile/app/data/repository/roles.dart';
import 'package:ecp_mobile/app/data/repository/tblDonvi.dart';
import 'package:ecp_mobile/app/data/repository/tblNhanVien.dart';

class GlobalData{
  static TblNhanVien tblNhanVien;
  static TblDonVi tblDonVi_current;
  static List<TblDonVi> tblDonVis=[];
  //static List<TblDonVi> tblDonVis;
  static List<Roles> roles;
  static String IDConnect;
  static bool KTGS=false;
}