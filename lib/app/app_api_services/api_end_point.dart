class ApiEndPoint{
  static bool isDev = true;

  static String baseUrl = (isDev)?"https://fitbe-dev.skill-mine.com" : "https://fitbe-main.skill-mine.com" ;

  static String signUpUrl = "$baseUrl/user";
  static String signInUrl = "$baseUrl/user/signIn";
  static String forGotPasswordVerifyOtp = "$baseUrl/forgotPassword/verifyOTP";
  static String verifySignInOTP = "$baseUrl/user/verifySignInOTP";
  static String userSignIn = "$baseUrl/user/signIn";
  static String forgotPasswordSendVerification = "$baseUrl/forgotPassword/sendVerification";
  static String forGotPassword(String ? id) => "$baseUrl/user/forgotPassword/$id";

  static String getUserDetails(String ? id) => "$baseUrl/user/$id";

  static String changePassword  = "$baseUrl/forgotPassword/updatePassword";
  static String preferences  = "$baseUrl/preferences";

}