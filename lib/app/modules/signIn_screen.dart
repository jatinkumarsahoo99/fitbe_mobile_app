import 'dart:convert';

import 'package:fitbe/app/app_utils/helper.dart';
import 'package:fitbe/app/app_utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../app_api_services/api_end_point.dart';
import '../app_api_services/http_methods.dart';
import '../app_theme/text_styles.dart';
import '../app_utils/shared_preferance.dart';
import '../common_widgets/common_button.dart';
import '../common_widgets/common_password_text_field.dart';
import '../common_widgets/common_text_field_view.dart';
import '../common_widgets/header_text_widget.dart';
import '../common_widgets/remove_focuse.dart';
import '../common_widgets/show_snack_bar.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> with Helper {
  TextEditingController emailIdOrMobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double usableHeight = size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: RemoveFocuse(
        onClick: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: usableHeight,
              child: Column(
                children: <Widget>[
                  /* const SizedBox(
                    height: 64,
                  ),*/
                  Expanded(flex: 3, child: Container()),
                  HeaderTextWidget(
                    headerText: "Sign In",
                    headDesc: "Welcome Back! Fill The Details To Sign In",
                    key: UniqueKey(),
                  ),
                  CommonTextFieldView(
                    controller: emailIdOrMobileController,
                    // errorText: _errorFName,
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    titleText: "Email ID Or Mobile Number",
                    hintText: "Email ID Or Mobile Number",
                    keyboardType: TextInputType.name,
                    onChanged: (String txt) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonPasswordTextFieldView(
                    titleText: "Password",
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    hintText: "Password",
                    isObscureText: true,
                    onChanged: (String txt) {},
                    // errorText: _errorPassword,
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          onTap: () {
                            // NavigationServices(context).gotoLoginScreen();
                            Navigator.pushNamed(context, "/forgotPassword");
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "Forgot Password",
                              style: TextStyles(context).googleRubikFontsForText2(fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CommonButton(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    buttonText: "Sign In",
                    onTap: () {
                      // showCommonPopupNew("Verification","Verification Pending\nPlease complete your verification",context,barrierDismissible: false,isYesOrNoPopup: false);
                      if (validate()) {
                        callSignInApi();
                        // Navigator.pushNamed(context, "/preferenceScreen");
                      }
                    },
                  ),
                  Expanded(flex: 7, child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Don't Have An Account? ",
                        textAlign: TextAlign.center,
                        style: TextStyles(context).googleRubikFontsForHeading(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      InkWell(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        onTap: () {
                          Navigator.pushNamed(context, "/signupScreen");
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Sign Up",
                            style: TextStyles(context).googleRubikFontsForText2(fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool validate() {
    if (emailIdOrMobileController.text == "") {
      ShowSnackBar.showError(context, "Please enter the email or mobile");
    } else if (passwordController.text == "") {
      ShowSnackBar.showError(context, "Please enter your password");
    } else if (!checkUserId(emailIdOrMobileController.text)) {
      ShowSnackBar.showError(context, "Please enter valid email Id or Mobile No");
    } else {
      return true;
    }
    return false;
  }

  bool checkUserId(String userId) {
    try {
      if (double.parse(userId).runtimeType == double && userId.length == 10) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (userId.isValidEmail()) {
        return true;
      } else {
        return false;
      }
      debugPrint(">>>>>>>>>>>>>exception$e");
    }
  }

  callSignInApi() {
    try {
      Utils.showProgressIndicator();
      Map<String, dynamic> postData = (Utils.checkIsDouble(emailIdOrMobileController.text) == false)
          ? {"EmailAddress": emailIdOrMobileController.text, "Password": passwordController.text}
          : {"MobileNumber": emailIdOrMobileController.text, "Password": passwordController.text};
      HttpMethodsDio().postMethod(
          api: ApiEndPoint.signInUrl,
          json: postData,
          fun: (map, code) {
            Utils.disMissProgressIndicator();

            if (map is Map) {
              if (map.containsKey("data") && map['data'] is Map && map["data"]['Status'] == "VERIFICATION_COMPLETED") {
                postData['userId'] = map['data']["UserID"];
                postData['EmailAddress'] = map['data']["EmailAddress"];
                postData['MobileNumber'] = map['data']["MobileNumber"];
                setLogInData(postData: postData, logInStatus: map["data"]['Status'],userId: map['data']["UserID"]);
                // EasyLoading.showSuccess("Loged In");
                Navigator.pushNamedAndRemoveUntil(context, "/preferenceScreen", (Route<dynamic> route) => false,);
              } else if (map.containsKey("data") && map['data'] is Map && map["data"]['Status'] == "VERIFICATION_PENDING") {
                postData['userId'] = map['data']["UserID"];
                postData['EmailAddress'] = map['data']["EmailAddress"];
                postData['MobileNumber'] = map['data']["MobileNumber"];
                setLogInData(postData: postData, logInStatus: map["data"]['Status'],userId: map['data']["UserID"]);
                openDialog(postData);
              } else if (map.containsKey("data") && map['data'] is Map && map["data"]['Status'] == "COMPLETED") {
                postData['userId'] = map['data']["UserID"];
                postData['EmailAddress'] = map['data']["EmailAddress"];
                postData['MobileNumber'] = map['data']["MobileNumber"];
                setLogInData(postData: postData, logInStatus: map["data"]['Status'],userId: map['data']["UserID"]);
                Navigator.pushNamedAndRemoveUntil(context, "/homeScreen", (Route<dynamic> route) => false,);
              } else if (map.containsKey("message")) {
                ShowSnackBar.showError(context, map["message"] ?? "Something went wrong");
              } else {
                ShowSnackBar.showError(context, "$map");
              }
            } else {
              ShowSnackBar.showError(context, "$map");
            }
          });
    } catch (e) {
      debugPrint("exception:$e");
      Utils.disMissProgressIndicator();
    }
  }

  setLogInData({required Map<String, dynamic> postData, required String logInStatus,required String userId}) async {
    SharedPref sharedPref = SharedPref();
    await sharedPref.save("isLogIn", "true");
    await sharedPref.save("userID", userId);
    await sharedPref.save("logInData", jsonEncode(postData));
    await sharedPref.save("logInSta", logInStatus);
  }

  openDialog(Map<String, dynamic> postData) async {
    bool isOk = await showCommonPopupNew("Verification", "Verification Pending\nPlease complete your verification", context,
        barrierDismissible: false, isYesOrNoPopup: false);
    if (isOk) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/verificationScreen",
            (Route<dynamic> route) => false,
        arguments: postData,
      );
    }
  }
}
