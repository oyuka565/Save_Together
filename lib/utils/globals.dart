library tomo.globals;

//import 'package:TOMO/model/CreateOrderRequest.dart';
//import 'package:TOMO/model/FooterPromo.dart';
//import 'package:TOMO/model/OrderDetailsInfo.dart';
//import 'package:TOMO/model/OrderReferenceData.dart';
//import 'package:TOMO/model/UserAddressSet.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Version
String version = '1.1.14';
bool isShowVersionDialog = true;

// Login
bool isUserInfoComplete = false;
bool isTermAccepted = false;
bool isAddressFromMenu = false;
String addressSelectionTrace = "";
String addressFilter = "";

//Colors
const Color blackColor = Color(0xff444444);
const Color blueColor = Color(0xff080a52);
const Color redColor = Color(0xffff0000);
const Color pinkColor = Color(0xffeb2188);
const Color darkGrayColor = Color(0xff333333);
const Color grayColor = Color(0xff707071);
const Color lightGrayColor = Color(0xfff2f2f2);
const Color greenColor = Color(0xff058A02);
const Color lightgreenColor = Color(0xff00C853);
const Color whiteColor = Colors.white;
const Color lightPinkColor = Color(0xffFFEBEE);
const Color grayColorSubHead = Color(0xffE3E3E3);
const Color orangeColor = Color(0xffF07300);
const Color hintGrayColor = Color(0xff9B9B9B);
//Url
const String urlGetDeviceCode =
    "https://gsysws.tomo.mn/services/ws_user.asmx/WS530001_getDeviceCode";
const String urlServiceAgreement =
    "https://gsysws.tomo.mn/services/ws_user.asmx/WS530004_acceptTerms"; //Үйлчилгээний нөхцөл хүлээн зөвшөөрөх
const String urlLogin =
    "https://gsysws.tomo.mn/services/ws_user.asmx/WS530002_clientLogin";
const String urlCreatePassword =
    "https://gsysws.tomo.mn/services/ws_user.asmx/WS530003_createPassword";
const String urlGetOrderReferenceData =
    "https://gsysws.tomo.mn/services/ws_order.asmx/WS530005_getOrderReferenceData"; //	Захиалга хийхэд хэрэгтэй лавлах мэдээллүүдийг авна
const String urlGetUserOrders =
    "https://gsysws.tomo.mn/services/ws_order.asmx/WS530010_getUserOrders";
const String urlGetUserOrders_inactive =
    "https://gsysws.tomo.mn/services/ws_order.asmx/WS530026_getUserOrders_inactive";

const String urlSaveUserInfo =
    "https://gsysws.tomo.mn/services/ws_user.asmx/WS530009_setUserInfo";
const String urlGetUserInfo =
    "https://gsysws.tomo.mn/services/ws_user.asmx/WS530020_getUserInfo";
const String urlCalcOrderRate =
    "https://gsysws.tomo.mn/services/ws_order.asmx/WS530021_calcOrderRate";
const String urlCreateOrder =
    "https://gsysws.tomo.mn/services/ws_order.asmx/WS530007_createOrder";

const String urlReferenceData =
    "https://gsysws.tomo.mn/services/ws_order.asmx/WS530005_getOrderReferenceData";

const String urlPackageShippingRate =
    "https://gsysws.tomo.mn/services/ws_order.asmx/WS530028_getRate";

const String urlInvoicePointInfo =
    "https://gsysws.tomo.mn/services/ws_order.asmx/WS530022_get_InvoicePointInfo";
const String urlWS530023_set_InvoicePoint =
    "https://gsysws.tomo.mn/services/ws_order.asmx/WS530023_set_InvoicePoint";
const String urlWS530024_set_InvoiceEbarimtType =
    "https://gsysws.tomo.mn/services/ws_order.asmx/WS530024_set_InvoiceEbarimtType";
const String urlWS530025_get_InvoicePaymentInfo =
    "https://gsysws.tomo.mn/services/ws_order.asmx/WS530025_get_InvoicePaymentInfo";
const String urlReceiveOrderDetailsInfo =
    "https://gsysws.tomo.mn/services/ws_order.asmx/WS530008_getOrderInfo";
const String urlFooterPromo =
    "https://gsysws.tomo.mn/services/ws_news.asmx/WS530006_getFooterPromo";
const String urlWS530014_getOrderTracking =
    "https://gsysws.tomo.mn/services/ws_order.asmx/WS530014_getOrderTracking";

const String urlPackageTracking =
    "https://gsysws.tomo.mn/services/ws_news.asmx/WS530019_getDeliveryChart";
const String urlWS530015_getNewsList =
    "https://gsysws.tomo.mn/services/ws_news.asmx/WS530015_getNewsList";

const String urlWS530015_getAdditionalServiceList =
    "https://gsysws.tomo.mn/services/ws_news.asmx/WS530032_getAdditionalServiceList";

const String WS530016_getNewsDetail =
    "https://gsysws.tomo.mn/services/ws_news.asmx/WS530016_getNewsDetail";

const String urlGetUserAddress =
    "https://gsysws.tomo.mn/services/ws_user.asmx/WS530011_getUserAddresses";
const String urlSetUserAddress =
    "https://gsysws.tomo.mn/services/ws_user.asmx/WS530012_setUserAddress";
const String urlDeleteUserAddress =
    "https://gsysws.tomo.mn/services/ws_user.asmx/WS530027_deleteUserAddress";
const String urlGetBranches =
    "https://gsysws.tomo.mn/services/ws_news.asmx/WS530017_getBranches";
const String urlGetNotifications =
    "https://gsysws.tomo.mn/services/ws_user.asmx/WS530018_getNotifications";
const String urlGetFile = "https://gsysws.tomo.mn/get_file.ashx";

const String urlHTMLContent =
    "https://gsysws.tomo.mn/services/ws_tomo_info.asmx/WS530030_getContent";

//images
String png_tomo_logo = "assets/images/tomo_logo.png";
String png_full_back = "assets/images/fullBack.jpg";
String png_line_pink = "assets/images/line_pink.png";
String png_line_gray = "assets/images/line_gray.png";
String png_link_order = "assets/images/link_order.png";
String png_start_page = "assets/images/startPage.jpg";
String png_banner1 = "assets/images/banner1.png";
String png_top_app_pink = "assets/images/top_app_pink.png";
String png_top_app_dark = "assets/images/top_app_dark.png";

String png_top_nav = "assets/images/top_nav.png";
String png_tomo_logo_order = "assets/images/tomo_logo_order.png";
String png_bell_red = "assets/images/bell_red.png";
String png_nav_menu_back = "assets/images/nav_menu_back.png";
String png_404 = "assets/images/404.png";
String png_server_error = "assets/images/server_error.png";
String png_back_btn = "assets/images/back_btn.png";
String png_close = "assets/images/close.png";
String png_notif_close = "assets/images/notif_close.png";
String png_arrow_btn_left = "assets/images/arrow_btn_left.png";
String png_arrow_btn_right = "assets/images/arrow_btn_right.png";
String png_add_good_btn = "assets/images/add_good_btn.png";
String png_delete_icon = "assets/images/delete_icon.png";
String enter_address_btn = "assets/images/enter_address_btn.png";
String question_round_dark = "assets/images/question.png";
String address_location = "assets/images/address_location.png";
String png_flag_black = "assets/images/flag_black.png";
String png_car_black = "assets/images/car_black.png";
String png_car_arrow_black = "assets/images/car_arrow_black.png";
String png_flag_transparent = "assets/images/flag_transparent.png";
String png_card_membership = "assets/images/card_membership.png";
String png_card_membership_white = "assets/images/card_membership_white.png";
String png_card_membership_pink = "assets/images/card_membership_pink.png";

String msg_HTTP = "Сервертэй холбогдож барсангүй!";
String msg_SAVE = "Захиалга бүртгэхэд алдаа гарлаа!";
String msg_TrackNotFount = "Замын мэдээлэл олдсонгүй!";

String userToken = "";
String deviceCode = "";
String orderId = "";
bool showProgress = false;

int indexPromo = 0; // Идэвхтэй промогийн дугаар
bool isAddressNew = true;
bool isAddressFillingFromSelection = false;

bool newAddressFromSubmitOrder = false;

