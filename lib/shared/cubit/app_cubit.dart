import 'dart:io';

import 'package:billingsystem/models/allbill.dart';
import 'package:billingsystem/models/approve.dart';
import 'package:billingsystem/models/billSearched.dart';
import 'package:billingsystem/models/billingSystemModels.dart';
import 'package:billingsystem/models/billsearchedCustomer.dart';
import 'package:billingsystem/models/calc.dart';
import 'package:billingsystem/models/createbill.dart';
import 'package:billingsystem/models/customermode.dart';
import 'package:billingsystem/models/deletepaid.dart';
import 'package:billingsystem/models/edit_profile_admin.dart';
import 'package:billingsystem/models/edituserprofile.dart';
import 'package:billingsystem/models/getpending.dart';
import 'package:billingsystem/models/oredercreat.dart';
import 'package:billingsystem/models/profile_adminmodel.dart';
import 'package:billingsystem/models/rejectmode.dart';
import 'package:billingsystem/models/sendCustomermodel.dart';
import 'package:billingsystem/models/sendR.dart';
import 'package:billingsystem/models/sendbillreq.dart';
import 'package:billingsystem/models/user_profile.dart';
import 'package:billingsystem/modules/invoices_screen/invoice.dart';
import 'package:billingsystem/modules/invoices_screen/invoiceAdmin.dart';
import 'package:billingsystem/modules/profile_screen/profile.dart';
import 'package:billingsystem/modules/profileuser/profile_user.dart';
import 'package:billingsystem/modules/requestScreenAdmin/requestScreenAdmin.dart';
import 'package:billingsystem/modules/requests_Screen_customer/requests_Screen_customer.dart';
import 'package:billingsystem/shared/componentes/constance.dart';
import 'package:billingsystem/shared/network/remote/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);
  String dropindexstatus = 'unpaid';
  void changindex(String index) {
    dropindexstatus = index;
    emit(changeindexadd_states());
  }

  List<BottomNavigationBarItem> bottomitem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.request_page),
      label: 'Requests',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.inventory_2_outlined),
      label: 'Invoices',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  List<Widget> ScreensCustomer = [
    reqestsCustomer(),
    Invoice(),
    Profile_user(),
  ];
  List<Widget> ScreensAdmin = [
    reqestsAdmin(),
    InvoiceAdmin(),
    Profile(),
  ];
  File? pickedfile;
  Future changeLogo() async {
    try {
      final XFile? pickedimage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedimage != null) {
        pickedfile = File(pickedimage.path);
      }
      emit(changeLogoState());
    } on PlatformException catch (e) {
      print(e);
    }
  }

  int CurrentIndex = 1;
  void changeBottomIndex(index) {
    CurrentIndex = index;
    emit(changeBottomIndexState());
  }

//اختيار المحافظة
  List<String> stateList = ['Damascus', 'Alleppo', 'Homs', 'Daraa', 'Hama'];
  var stateindex = 0;
  void changstateindex(String index) {
    stateindex = stateList.indexOf(index);
    emit(changestateindexState());
  }

//قائمة فواتير المستخدم
  late Billmodel invoicesCus = Billmodel();
  void getinvoicesCustomer() {
    emit(GetinvoiceloadingState());

    diohelper.getData(url: getCusBills, token: accesstoken).then((value) {
      invoicesCus = Billmodel.fromJson(value.data);

      emit(GetInvoceSucessState(invoicesCus));
    }).catchError((error) {
      print(error.toString());
      emit(GetInvoceErorrState(error.toString()));
    });
  }

//قائمةفواتير الادمن
  late Billmodel invoicesA = Billmodel();
  void getinvoicesAdmn() {
    emit(GetinvoiceAdmnloadingState());

    diohelper.getData(url: getAdminsBills, token: accesstoken).then((value) {
      invoicesA = Billmodel.fromJson(value.data);
      print(invoicesA.data![0].billNumber);
      emit(GetInvoceAdmnSucessState(invoicesA));
    }).catchError((error) {
      print(error.toString());
      emit(GetInvoceAdmnErorrState(error.toString()));
    });
  }

  List<String> items = ['Tradesman', 'Customer'];
  static int rolid = 0;
  void changRoleindex(String index) {
    rolid = items.indexOf(index);

    //print(rolid);
    emit(RegisterchangeindexState());
  }

//تسجل الدخول
  billingSystemModel? loginmodel;
  void login({required String email, required String password}) {
    emit(loginLoadingState());
    diohelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      loginmodel = billingSystemModel.fromJson(value.data);
      accesstoken = value.data['access_token'];
      // getadmindata(accesstoken);
      getuserdata(accesstoken);
      getadmindata(accesstoken);
      emit(loginSucessesState(loginmodel!));
      //print(value.data);
      print(accesstoken);
    }).catchError((error) {
      emit(loginErrorState(error.toString()));
      print(error);
    });
  }

//التجسل بحسب الدور
  billingSystemModel? modelRegister;
  void Register(
      {required String email,
      required String password,
      required String password_confirmation,
      required String roleId}) {
    emit(RegisterLoadingState());
    diohelper.postData(url: SIGNUP, data: {
      'email': email,
      'password': password,
      'password_confirmation': password_confirmation,
      'role_id': roleId
    }).then((value) {
      modelRegister = billingSystemModel.fromJson(value.data);
      emit(RegisterSucessesState(modelRegister!));
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
      print(error);
    });
  }

//اطهار واخفاء كلمة السر
  IconData suffixPass = Icons.visibility_off_outlined;
  bool isPassShown = true;
  void changePassvisiblity() {
    isPassShown = !isPassShown;
    suffixPass =
        isPassShown ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(changePassVisbilityState());
  }

//انشاء معلومات للمستخدم
  void CreateProfileAdmin(
      {required business_name,
      required phone_number,
      required city,
      required region,
      required logo_img_url,
      String? token}) async {
    emit(addadminInfoloadingfoState());
    String fileName = logo_img_url.path.split('/').last;
    FormData formData = FormData.fromMap({
      'logo': await MultipartFile.fromFile(logo_img_url.path,
          filename: fileName, contentType: new MediaType('image', 'png')),
      'business_name': business_name,
      'phone_number': phone_number,
      'city': city,
      'region': region,
    });
    diohelper
        .postData(
            url: Createprofadmin,
            token: accesstoken,
            content_type: 'multipart/form-data',
            data: formData)
        .then((value) {
      print(value.data);
      emit(addadminInfoSucessesState());
    }).catchError((error) {
      emit(addadminInfoErrorState(error.toString()));
      print(error);
    });
    ;
  }

  // model m;
  void CreateProfileCustomer(
      {required firstname,
      required lastname,
      required username,
      required phone,
      String? token}) async {
    emit(addadminInfoloadingfoState());
    diohelper.postData(url: Creatprofcus, token: token, data: {
      'first_name': firstname,
      'last_name': lastname,
      'user_name': username,
      'phone_number': phone
    }).then((value) {
      // = mode.fromjson(value);
      emit(addCustomerInfoSucessesState());
      print(value.data);
    }).catchError((error) {
      emit(addCustomerInfoErrorState(error.toString()));
      print(error);
    });
    ;
  }

  late Searchbillmodel search = Searchbillmodel();
  void getsearchbill(String Value) {
    emit(GetSearchloadingState());
    diohelper //
        .getData(url: searchofBill + '/$Value', token: accesstoken)
        .then((value) {
      search = Searchbillmodel.fromJson(value.data);
      print('${searchofBill}/$Value');

      emit(GetSearchSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSearchErorrState(error.toString()));
    });
  }

  late SearchCusModel searchcus = SearchCusModel();
  void getsearchbillCus(String Value) {
    emit(GetSearchCusloadingState());
    diohelper
        .getData(url: searchbillbyusername + '/$Value', token: accesstoken)
        .then((value) {
      searchcus = SearchCusModel.fromJson(value.data);
      //print('${searchofBill}/$Value');
      // print(invoicesA[1]['revelation_place']);
      emit(GetSearchCusSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSearchCusErorrState(error.toString()));
    });
  }

  late Billmodel invoicesAdminPaid = Billmodel();
  void getinvoicesAdminPaid() {
    emit(getinvoiceAdminPaidloadingState());
    diohelper
        .getData(url: getinvoiceadminpaid, token: accesstoken)
        .then((value) {
      invoicesAdminPaid = Billmodel.fromJson(value.data);
      print(invoicesAdminPaid.data![0].billNumber);
      emit(getinvoiceAdminPaidSuccState(invoicesAdminPaid));
    }).catchError((error) {
      print(error.toString());
      emit(getinvoiceAdminPaidErrorState(error.toString()));
    });
  }

  late Billmodel invoicesAdminUnPaid = Billmodel();
  void getinvoicesAdminUnPaid() {
    emit(getinvoiceAdminUnPaidloadingState());
    diohelper
        .getData(url: getinvoiceadminupaid, token: accesstoken)
        .then((value) {
      invoicesAdminUnPaid = Billmodel.fromJson(value.data);
      print(invoicesAdminUnPaid.data![0].billNumber);
      emit(getinvoiceAdminUnPaidSuccState(invoicesAdminUnPaid));
    }).catchError((error) {
      print(error.toString());
      emit(getinvoiceAdminUnPaidErrorState(error.toString()));
    });
  }

  //late CostumerProfile cus = CostumerProfile();
  late SendR res = SendR();
  void sendRequest(user) {
    emit(sendRequestLoadingState());
    diohelper
        .postData(url: sendrequestadmin + '/${user}', token: accesstoken)
        .then((value) {
      res = SendR.fromJson(value.data);
      emit(sendRequestSuccessState(res));
    }).catchError((error) {
      print(error.toString());
      emit(sendRequestErrorState(error));
    });
  }

  late ProfileAdmin profile_admModel = ProfileAdmin();
  void getadmindata(token) {
    emit(profileLoading_admin());
    diohelper.getData(url: getdataprofile, token: accesstoken).then((value) {
      profile_admModel = ProfileAdmin.fromJson(value.data);

      print(profile_admModel.data!.businessName);
      emit(profileSucesses_admin(profile_admModel));
    }).catchError((error) {
      print(error.toString());
      emit(profileError_admin(error.toString()));
    });
  }

  late Profileuser profile_userModel = Profileuser();
  void getuserdata(token) {
    emit(userprofilloading());
    diohelper.getData(url: gettcusdataprof, token: token).then((value) {
      profile_userModel = Profileuser.fromJson(value.data);
      emit(userprofilSucesses(profile_userModel));
    }).catchError((error) {
      print(error.toString());
      emit(userprofileError(error.toString()));
    });
  }

  var idbill;
  late Createbill CreateRes = Createbill();
  void creatbill(
      {required username,
      required duedate,
      required ratevat,
      required status,
      context}) async {
    emit(creatBillloadingState());
    diohelper.postData(url: creatBill, token: accesstoken, data: {
      'user_name': username,
      'due_date': duedate,
      'rate_vat': ratevat,
      'status': status
    }).then((value) {
      CreateRes = Createbill.fromJson(value.data);
      emit(creatBillsuccessState(CreateRes));
      print(CreateRes.message);
      //id = CreateRes.billid;
    }).catchError((error) {
      print(error.toString());
      emit(creatBillerrorState());
    });
  }

  late Createorder Creatorderres = Createorder();
  void additem(
      {required name,
      required quantity,
      required priceone,
      required context,
      required id}) async {
    emit(creatOrderloadingState());
    diohelper.postData(
      token: accesstoken,
      url: 'admin/bills/${id}/orders',
      data: {
        'product': name,
        'price_one': priceone,
        'quantity': quantity,
      },
    ).then((value) {
      emit(creatOrdersuccessState());
      Creatorderres = Createorder.fromJson(value.data);
      print(Creatorderres.message);
      print(Creatorderres.total);
    }).catchError((error) {
      emit(creatOrdererrorState());
      print(error);
    });
  }

  late Calc calcRes = Calc();
  void calc({required context, required id}) {
    diohelper
        .postData(url: 'admin/bills/${id}/vats', data: {}, token: accesstoken)
        .then((value) {
      calcRes = Calc.fromJson(value.data);
      print(calcRes.totalPrice);
    }).catchError((error) {
      print(error.toString());
    });
  }

  late Sendinvres sendRes = Sendinvres();
  void sendinvoice({required customername, required id}) {
    diohelper
        .postData(
            url: 'admin/sendBill/${customername}/bill/${id}',
            token: accesstoken)
        .then((value) {
      sendRes = Sendinvres.fromJson(value.data);
      emit(sendinvoicesucssState(sendRes));
      print(sendRes.massage);
    }).catchError((error) {
      print(error.toString());
      emit(sendinvoicerrorState());
    });
  }

  late Logoutmodel logout_admModel = Logoutmodel();
  void logout() {
    emit(profileLoading());
    diohelper.postData(url: LogOut, token: accesstoken).then((value) {
      logout_admModel = Logoutmodel.fromJson(value.data);
      emit(logoutSucesses_admin(logout_admModel));
      var message = logout_admModel.message;
      print(message);
    }).catchError((error) {
      emit(profileError(error.toString()));
    });
  }

  late DeleteprofileAdmin delete_admModel = DeleteprofileAdmin();
  void deleteprofileadmin() {
    emit(profileLoading());
    diohelper.deleteData(url: deleteAmProf, token: accesstoken).then((value) {
      logout_admModel = Logoutmodel.fromJson(value.data);
      emit(deleteprofileSucesses_admin(delete_admModel));
      var message = delete_admModel.message;
      print(message);
    }).catchError((error) {
      emit(profileError(error.toString()));
    });
  }

  late Getrequestpending getpenres = Getrequestpending();
  void getpending() {
    emit(getpendingLoadingState());
    diohelper.getData(url: getPendingRequest, token: accesstoken).then((value) {
      emit(getpendinggSuccState());
      getpenres = Getrequestpending.fromJson(value.data);
      print(getpenres.request![0].status);
    }).catchError((erroe) {
      emit(getpendingErrorState());
      print(erroe);
    });
  }

  late Logoutmodelu logout_userModel = Logoutmodelu();
  void logout_user() {
    diohelper.postData(url: LogOut, token: accesstoken).then((value) {
      logout_userModel = Logoutmodelu.fromJson(value.data);

      var message = logout_userModel.message;
      emit(userlogoutSucesses(logout_userModel));
      print(message);
      emit(userlogoutSucesses(logout_userModel));
    }).catchError((error) {
      emit(userprofileError(error.toString()));
    });
  }

  late Deleteprofileuser delete_userModel = Deleteprofileuser();
  void deleteprofileus() {
    emit(userprofilloading());
    diohelper.deleteData(url: delAccount, token: accesstoken).then((value) {
      delete_userModel = Deleteprofileuser.fromJson(value.data);
      emit(userdeleteSucesses(delete_userModel));
      var message = delete_userModel.message;
      print(message);
    }).catchError((error) {
      emit(userprofileError(error.toString()));
    });
  }

  late Approve approvRes = Approve();
  void approve(id) {
    emit(approveloadingState());
    diohelper
        .postData(url: 'costumer/approve/${id}', token: accesstoken)
        .then((value) {
      approvRes = Approve.fromJson(value.data);
      emit(approvesuccState());
    }).catchError((error) {
      emit(approveErrorState());
      print(error);
    });
  }

  late Reject rejectRes = Reject();
  void reject(id) {
    emit(RejectloadingState());
    diohelper
        .postData(url: '/costumer/reject/${id}', token: accesstoken)
        .then((value) {
      emit(RejectsuccState());
      rejectRes = Reject.fromJson(value.data);
    }).catchError((error) {
      print(error);
      emit(RejectErrorState());
    });
  }

  late EditprofileAdmin editprofileAdmin = EditprofileAdmin();
  void admin_editprofile(
      {business_name, phone, region, city, logo_url, String? token}) async {
    emit(EditprofileLoading());
    String fileName = logo_url.path.split('/').last;

    FormData formData = FormData.fromMap({
      'logo': await MultipartFile.fromFile(logo_url.path,
          filename: fileName, contentType: new MediaType('image', 'png')),
      'business_name': business_name,
      'phone_number': phone,
      'city': city,
      'region': region,
    });

    diohelper
        .putData(
            url: 'admin/editprofile',
            token: token,
            content_type: '',
            data: formData)
        .then((value) {
      editprofileAdmin = EditprofileAdmin.fromJson(value.data);

      emit(EditprofileSucesses(editprofileAdmin));
      var messagee = editprofileAdmin.message;

      print(messagee);
    }).catchError((error) {
      emit(EditprofileError(error.toString()));
    });
  }

  String dropindexedit = 'Damascus';
  void changindexed(String index) {
    dropindexedit = index;
    emit(Editprofilechangeindex());
  }

  late Deletepaidbill deletbil = Deletepaidbill();
  void Deletbill(id) {
    diohelper
        .deleteData(url: 'costumer/destroy/${id}', token: accesstoken)
        .then((value) {
      deletbil = Deletepaidbill.fromJson(value.data);
      print('Deleted ');
    }).catchError((error) {
      print(error.toString());
    });
  }

  late Editprofileuser editprofileuser = Editprofileuser();
  void user_editprofile(
      {user_name, phone, first_name, last_name, String? token}) {
    emit(EdituserLoading());
    diohelper.putData(url: 'costumer/updateprofile', token: token, data: {
      'first_name': first_name,
      'last_name': last_name,
      'user_name': user_name,
      'phone_number': phone,
    }).then((value) {
      editprofileuser = Editprofileuser.fromJson(value.data);

      var messagee = editprofileuser.message;
      print(messagee);
      emit(EditusereSucesses(editprofileuser));
    }).catchError((error) {
      print(error.toString());
      emit(EditusereError(error.toString()));
    });
  }
}

  
 

  /// لطباعة الداتا الراجعة

