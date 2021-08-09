import '../../app/modules/requset_location_module/requset_location_page.dart';
import '../../app/modules/requset_location_module/requset_location_bindings.dart';
import '../../app/modules/register_module/register_page.dart';
import '../../app/modules/register_module/register_bindings.dart';
import '../../app/modules/ktgs_module/ktgs_page.dart';
import '../../app/modules/ktgs_module/ktgs_bindings.dart';

import 'package:ecp_mobile/app/modules/plv_ds_module/plv_detail_module/ktgs_plv_module/ktgs_plv_bindings.dart';
import 'package:ecp_mobile/app/modules/plv_ds_module/plv_detail_module/ktgs_plv_module/ktgs_plv_page.dart';

import '../../app/modules/chon_don_vi_lam_viec_module/chon_don_vi_lam_viec_page.dart';
import '../../app/modules/chon_don_vi_lam_viec_module/chon_don_vi_lam_viec_bindings.dart';
import '../../app/modules/plv_search_dialog_module/plv_search_dialog_page.dart';
import '../../app/modules/plv_search_dialog_module/plv_search_dialog_bindings.dart';
import '../../app/modules/upload_image_free_module/upload_image_free_page.dart';
import '../../app/modules/upload_image_free_module/upload_image_free_bindings.dart';
import 'package:ecp_mobile/app/modules/plv_ds_module/plv_detail_module/image_view_detail_module/image_view_detail_bindings.dart';
import 'package:ecp_mobile/app/modules/plv_ds_module/plv_detail_module/image_view_detail_module/image_view_detail_page.dart';

import '../../app/modules/plv_ds_module/plv_detail_module/plv_detail_bindings.dart';
import '../../app/modules/plv_ds_module/plv_detail_module/plv_detail_page.dart';
import '../../app/modules/plv_ds_module/plv_ds_page.dart';
import '../../app/modules/plv_ds_module/plv_ds_bindings.dart';
import '../../app/modules/main_module/main_page.dart';
import '../../app/modules/main_module/main_bindings.dart';
import '../../app/modules/tab_module/tab_page.dart';
import '../../app/modules/tab_module/tab_bindings.dart';
import '../../app/modules/login_module/login_bindings.dart';
import '../../app/modules/login_module/login_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';
/**
 * GetX Generator - fb.com/htngu.99
 * */

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => loginPage(),
      binding: loginBinding(),

    ),
    GetPage(
      name: Routes.TAB,
      page: () => tabPage(),
      binding: tabBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => mainPage(),
      binding: mainBinding(),
      // transition: Transition.zoom,
      // transitionDuration: Duration(seconds: 1)
    ),
    GetPage(
      name: Routes.PLV_DS,
      page: () => plv_dsPage(),
      binding: plv_dsBinding(),
    ),
    GetPage(
      name: Routes.PLV_DETAIL,
      page: () => plv_detailPage(),
      binding: plv_detailBinding(),
    ),
    GetPage(
      name: Routes.IMAGE_VIEW_DETAIL,
      page: () => ImageViewDetailPage(),
      binding: ImageViewDetailBinding(),
    ),
    GetPage(
      name: Routes.UPLOAD_IMAGE_FREE,
      page: () => uploadImageFreePage(),
      binding: uploadImageFreeBinding(),
    ),
    GetPage(
      name: Routes.PLV_SEARCH_DIALOG,
      page: () => plvSearchDialogPage(),
      binding: plvSearchDialogBinding(),
    ),
    GetPage(
      name: Routes.CHON_DON_VI_LAM_VIEC,
      page: () => chonDonViLamViecPage(),
      binding: chonDonViLamViecBinding(),
    ),
    GetPage(
      name: Routes.KTGS_PLV,
      page: () => ktgs_plvPage(),
      binding: ktgs_plvBinding(),
    ),
    GetPage(
      name: Routes.KTGS,
      page: () => ktgsPage(),
      binding: ktgsBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => registerPage(),
      binding: registerBinding(),
    ),
    GetPage(
      name: Routes.REQUSET_LOCATION,
      page: () => requsetLocationPage(),
      binding: requsetLocationBinding(),
    ),
  ];
}
