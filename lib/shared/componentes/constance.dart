import 'package:billingsystem/shared/network/local/cache_helper.dart';

const SIGNUP = 'auth/signup';
const LOGIN = 'auth/login';
const Createprofadmin = 'admin/updateProfile';
const Creatprofcus = 'costumer/editprofile';
String? accesstoken;
const getAdminsBills = 'admin/bills';
const getCusBills = 'costumer/index';
const getdataprofile = 'admin/getprofile';
const gettcusdataprof = 'costumer/getprofile';
const getinvoiceadminpaid = 'admin/invoicePaid';
const getinvoiceadminupaid = 'admin/invoiceUnPaid';
const searchofCustomer = 'admin/searchCostumer';
const searchofBill = 'admin/searchBill';
const sendrequestadmin = 'admin/addCostumer';
const creatBill = 'admin/bills';
const addproduct = 'admin/bills/billid';
const calc = 'admin/bills/1/vats';
const getPendingRequest = 'costumer/getRequests';
const LogOut = 'auth/logout';
const deleteAmProf = 'admin/deleteAccount';
const searchbillbyusername = 'costumer/searchBill';
//const approve = 'costumer/approve/'
const delAccount = 'costumer/deleteAccount';
