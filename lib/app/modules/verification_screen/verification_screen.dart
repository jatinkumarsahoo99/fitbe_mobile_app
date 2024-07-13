import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../app_api_services/api_end_point.dart';
import '../../app_api_services/http_methods.dart';
import '../../app_theme/text_styles.dart';
import '../../app_utils/shared_preferance.dart';
import '../../app_utils/utils.dart';
import '../../common_widgets/common_button.dart';
import '../../common_widgets/remove_focuse.dart';
import '../../common_widgets/show_snack_bar.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController emailOtpTextEditingController = TextEditingController();
  TextEditingController mobileOtpTextEditingController = TextEditingController();

  String emailOtp = "";
  String mobileOtp = "";
  SharedPref sharedPref = SharedPref();
  String userId ="";
  Map<String,dynamic> argumentData = {};
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    argumentData = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
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
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 0.1),
                                borderRadius: BorderRadius.circular(20),
                                // color: const Color(0xFFD9D9D9)
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_back_sharp,
                                  size: 20,
                                ),
                              )),
                        )
                      ],
                    ),
                    Expanded(flex: 1, child: Container()),
                    Padding(
                      padding: const EdgeInsets.only(left: 76.0, right: 76, top: 0, bottom: 0),
                      child: Text(
                        "Verification",
                        textAlign: TextAlign.center,
                        style: TextStyles(context).googleRubikFontsForHeading(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 76.0, right: 76, top: 0, bottom: 0),
                      child: Text(
                        "Enter Verification Codes to Confirm.",
                        textAlign: TextAlign.center,
                        style: TextStyles(context).googleRubikFontsForText(fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      children: [
                        Text(
                          "Email Verification Code",
                          style: TextStyles(context).googleRubikFontsForSecondaryText(fontSize: 12, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                      child: PinFieldAutoFill(
                        textInputAction: TextInputAction.done,
                        codeLength: 4,
                        controller: emailOtpTextEditingController,
                        decoration: BoxLooseDecoration(
                            radius: const Radius.circular(10),
                            strokeColorBuilder: const FixedColorBuilder(
                              Color(0xFFF4F6F9),
                            ),
                            bgColorBuilder: const FixedColorBuilder(
                              Color(0xFFF4F6F9),
                            ),
                            gapSpace: 12.67),
                        currentCode: emailOtp,
                        onCodeSubmitted: (code) {
                          if (code.toString().length == 4) {
                            debugPrint("onCodeSubmitted $code");
                            emailOtp = code ?? "";
                          }
                        },
                        onCodeChanged: (code) {
                          if (code.toString().length == 4) {
                            debugPrint("onCodeSubmitted $code");
                            emailOtp = code ?? "";
                          }
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "[${argumentData['EmailAddress']}]",
                          style: TextStyles(context).googleRubikFontsForText(fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        InkWell(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          onTap: () {
                            // NavigationServices(context).gotoLoginScreen();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "Resend OTP",
                              style: TextStyles(context).googleRubikFontsForText2(fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Text(
                          "Mobile Verification Code",
                          style: TextStyles(context).googleRubikFontsForSecondaryText(fontSize: 12, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                      child: PinFieldAutoFill(
                        textInputAction: TextInputAction.done,
                        codeLength: 4,
                        controller: mobileOtpTextEditingController,
                        decoration: BoxLooseDecoration(
                            radius: const Radius.circular(10),
                            strokeColorBuilder: const FixedColorBuilder(
                              Color(0xFFF4F6F9),
                            ),
                            bgColorBuilder: const FixedColorBuilder(
                              Color(0xFFF4F6F9),
                            ),
                            gapSpace: 12.67),
                        currentCode: mobileOtp,
                        onCodeSubmitted: (code) {
                          debugPrint("onCodeSubmitted $code");
                          if (code.toString().length == 4) {
                            debugPrint("onCodeSubmitted $code");
                            mobileOtp = code ?? "";
                          }
                        },
                        onCodeChanged: (code) {
                          if (code.toString().length == 4) {
                            debugPrint("onCodeSubmitted $code");
                            mobileOtp = code ?? "";
                          }
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "[+91 ${argumentData['MobileNumber']}]",
                          style: TextStyles(context).googleRubikFontsForText(fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        InkWell(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          onTap: () {
                            // NavigationServices(context).gotoLoginScreen();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "Resend OTP",
                              style: TextStyles(context).googleRubikFontsForText2(fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CommonButton(
                      padding: const EdgeInsets.only(left: 0, right: 0),
                      buttonText: "Verify",
                      backgroundColor: const Color(0xFF2CBFD3),
                      radius: 30,
                      height: 48,
                      onTap: () {
                        callVerifyAPi(argumentData['userId']);
                      },
                    ),
                    Expanded(flex: 7, child: Container()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already Have An Account? ",
                          textAlign: TextAlign.center,
                          style: TextStyles(context).googleRubikFontsForHeading(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        InkWell(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          onTap: () {
                            // NavigationServices(context).gotoLoginScreen();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "Sign In",
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
      ),
    );
  }

  callVerifyAPi(String userId) async {
    try {
      Utils.showProgressIndicator();
      // userId = await sharedPref.getKey("userId")??"";

      Map<String, dynamic> postData = {
        "userId": userId??"",
        "EmailAddressOTP": emailOtp,
        "MobileNumberOTP": mobileOtp
      };
      debugPrint(">>>>>>postData$postData");
      HttpMethodsDio().postMethod(api:ApiEndPoint.verifySignInOTP, fun: (map,code) {
        Utils.disMissProgressIndicator();
        if(code == 200){
          Navigator.pushNamed(context, "/signInScreen");
        }else if(map is Map && map.containsKey("message")){
          ShowSnackBar.showError(context, map["message"]??"Something went wrong");
        }else{
          ShowSnackBar.showError(context, "$map");
        }

      }, json: postData);
    } catch (e) {
      Utils.disMissProgressIndicator();
      debugPrint(">>>>>>>>>>exception$e");
    }
  }
}
