part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class changeLogoState extends AppState {}

class changeBottomIndexState extends AppState {}

class RegisterLoadingState extends AppState {}

class RegisterSucessesState extends AppState {
  RegisterSucessesState(this.model);
  billingSystemModel model;
}

class RegisterchangeindexState extends AppState {}

class RegisterErrorState extends AppState {
  final String error;

  RegisterErrorState(this.error);
}

class loginLoadingState extends AppState {}

class loginSucessesState extends AppState {
  loginSucessesState(this.model);
  billingSystemModel model;
}

class loginErrorState extends AppState {
  final String error;

  loginErrorState(this.error);
}

class addadminInfoloadingfoState extends AppState {}

class addadminInfoSucessesState extends AppState {}

class addadminInfoErrorState extends AppState {
  final String error;

  addadminInfoErrorState(this.error);
}

class addCustomerInfoloadingfoState extends AppState {}

class addCustomerInfoSucessesState extends AppState {}

class addCustomerInfoErrorState extends AppState {
  final String error;

  addCustomerInfoErrorState(this.error);
}

abstract class EditprofileStates {}

class changePassVisbilityState extends AppState {}

class changestateindexState extends AppState {}

class GetinvoiceloadingState extends AppState {}

class GetInvoceSucessState extends AppState {
  GetInvoceSucessState(Billmodel invoicesCus);
}

class GetInvoceErorrState extends AppState {
  final String error;
  GetInvoceErorrState(this.error);
}

class billBottomNavState extends AppState {}

class GetinvoiceAdmnloadingState extends AppState {}

class GetInvoceAdmnSucessState extends AppState {
  final Billmodel invoicesA;
  GetInvoceAdmnSucessState(this.invoicesA);
}

class GetInvoceAdmnErorrState extends AppState {
  final String error;
  GetInvoceAdmnErorrState(this.error);
}

// class getProfLoadingState extends AppState {}

// class getProfSuccState extends AppState {
//   getProfSuccState(UserDataAdmin user);
// }

// class getProfErorState extends AppState {
//   final String error;
//   getProfErorState(this.error);
// }

// class getProfuserLoadingState extends AppState {}

// class getProfuserSuccState extends AppState {
//   getProfuserSuccState(UserDatacus userCus);
// }

// class getProfuserErorState extends AppState {
//   final String error;
//   getProfuserErorState(this.error);
// }

class GetSearchloadingState extends AppState {}

class GetSearchSucessState extends AppState {}

class GetSearchErorrState extends AppState {
  final String error;
  GetSearchErorrState(this.error);
}

class GetSearchCusloadingState extends AppState {}

class GetSearchCusSucessState extends AppState {}

class GetSearchCusErorrState extends AppState {
  final String error;
  GetSearchCusErorrState(this.error);
}

class getinvoiceAdminPaidloadingState extends AppState {}

class getinvoiceAdminPaidSuccState extends AppState {
  final Billmodel invoice;
  getinvoiceAdminPaidSuccState(this.invoice);
}

class getinvoiceAdminPaidErrorState extends AppState {
  final String error;
  getinvoiceAdminPaidErrorState(this.error);
}

class getinvoiceAdminUnPaidSuccState extends AppState {
  final Billmodel invoice;

  getinvoiceAdminUnPaidSuccState(this.invoice);
}

class getinvoiceAdminUnPaidloadingState extends AppState {}

class getinvoiceAdminUnPaidErrorState extends AppState {
  final String error;
  getinvoiceAdminUnPaidErrorState(this.error);
}

class sendRequestSuccessState extends AppState {
  final SendR res;
  sendRequestSuccessState(this.res);
}

class sendRequestLoadingState extends AppState {}

class sendRequestErrorState extends AppState {
  final String error;
  sendRequestErrorState(this.error);
}

class profileInitial extends AppState {}

class profileLoading extends AppState {}

class profileSucesses extends AppState {
  final ProfileAdmin? profile_admModel;

  profileSucesses(this.profile_admModel);
}

class profileError extends AppState {
  final String error;
  profileError(this.error);
}

class initialadd_states extends AppState {}

class loadingadd_states extends AppState {}

class changeindexadd_states extends AppState {}

class creatBillsuccessState extends AppState {
  final Createbill creatres;
  creatBillsuccessState(this.creatres);
}

class creatBillloadingState extends AppState {}

class creatBillerrorState extends AppState {}

class creatOrdersuccessState extends AppState {}

class creatOrderloadingState extends AppState {}

class creatOrdererrorState extends AppState {}

class profileLoading_admin extends AppState {}

class profileSucesses_admin extends AppState {
  final ProfileAdmin? profile_admModel;

  profileSucesses_admin(this.profile_admModel);
}

class profileError_admin extends AppState {
  final String error;
  profileError_admin(this.error);
}

class logoutSucesses_admin extends AppState {
  final Logoutmodel? logout_admModel;

  logoutSucesses_admin(this.logout_admModel);
}

class deleteprofileSucesses_admin extends AppState {
  final DeleteprofileAdmin? delete_admModel;

  deleteprofileSucesses_admin(this.delete_admModel);
}

class userprofilloading extends AppState {}

class userprofilSucesses extends AppState {
  final Profileuser? profile_userModel;

  userprofilSucesses(this.profile_userModel);
}

class userlogoutSucesses extends AppState {
  final Logoutmodelu? logout_userModel;

  userlogoutSucesses(this.logout_userModel);
}

class userdeleteSucesses extends AppState {
  final Deleteprofileuser? deleteprofileuse;

  userdeleteSucesses(this.deleteprofileuse);
}

class userprofileError extends AppState {
  final String error;
  userprofileError(this.error);
}

class sendinvoicesucssState extends AppState {
  final Sendinvres send;
  sendinvoicesucssState(this.send);
}

class sendinvoicerrorState extends AppState {}

class getpendinggSuccState extends AppState {}

class getpendingErrorState extends AppState {}

class getpendingLoadingState extends AppState {}

class approvesuccState extends AppState {}

class approveloadingState extends AppState {}

class approveErrorState extends AppState {}

class RejectsuccState extends AppState {}

class RejectloadingState extends AppState {}

class RejectErrorState extends AppState {}

class EditprofileLoading extends AppState {}

class EditprofileSucesses extends AppState {
  final EditprofileAdmin? edit_profile;

  EditprofileSucesses(this.edit_profile);
}

class Editprofilechangeindex extends AppState {}

class EditprofileError extends AppState {
  final String error;
  EditprofileError(this.error);
}

class EdituserLoading extends AppState {}

class EditusereSucesses extends AppState {
  final Editprofileuser edit_userprofile;

  EditusereSucesses(this.edit_userprofile);
}

class EditusereError extends AppState {
  final String error;
  EditusereError(this.error);
}
