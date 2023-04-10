class apiRoute {
  //local endpoint
  static const local = "http://localhost:8000";
  // static const heroku = "https://pocketpay.herokuapp.com";

  static const base = "$local/api";
  // static const merchantBase = "$local/merchant";

  //customer
  static const registerStaff = "$base/register-staff";
  static const fetchOrganizationStaffs = "$base/fetch-staffs";
  static const adminLogin = "$base/login-admin";
  static const staffLogin = "$base/login-staff";

  static const fetchAdminProfile = "$base/fetch-admin-profile";
  static const fetchStaffProfile = "$base/login-staff";

}