import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../app_api_services/api_end_point.dart';
import '../../app_api_services/http_methods.dart';
import '../../app_theme/text_styles.dart';
import '../../app_utils/utils.dart';
import '../../common_widgets/common_button.dart';
import '../../common_widgets/header_text_widget.dart';
import '../../common_widgets/remove_focuse.dart';
import '../../common_widgets/show_snack_bar.dart';

class ForgotPasswordOtp extends StatefulWidget {
  const ForgotPasswordOtp({super.key});

  @override
  State<ForgotPasswordOtp> createState() => _ForgotPasswordOtpState();
}

class _ForgotPasswordOtpState extends State<ForgotPasswordOtp> {
  TextEditingController otpTextEditingController = TextEditingController();
  String otpVal = "";
  Map<String, dynamic> argumentData = {};

  @override
  Widget build(BuildContext context) {
    argumentData = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

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
                    HeaderTextWidget(
                      headerText: "Verification",
                      headDesc: "Enter Verification Codes to Confirm.",
                      key: UniqueKey(),
                    ),
                    Row(
                      children: [
                        Text(
                          "${(argumentData['isMobile'] == true) ?"Mobile":"Email"} Verification Code",
                          style: TextStyles(context).googleRubikFontsForSecondaryText(fontSize: 12, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                      child: PinFieldAutoFill(
                        textInputAction: TextInputAction.done,
                        codeLength: 4,
                        controller: otpTextEditingController,
                        decoration: BoxLooseDecoration(
                            radius: const Radius.circular(10),
                            strokeColorBuilder: const FixedColorBuilder(
                              Color(0xFFF4F6F9),
                            ),
                            bgColorBuilder: const FixedColorBuilder(
                              Color(0xFFF4F6F9),
                            ),
                            gapSpace: 12.67),
                        currentCode: otpVal,
                        onCodeSubmitted: (code) {
                          debugPrint("onCodeSubmitted $code");
                          otpTextEditingController.text = code;
                          otpVal = code;
                          /*if (code.toString().length == 4) {
                            debugPrint("onCodeSubmitted $code");
                            otpTextEditingController.text = code;
                            otpVal = code;
                          }*/
                        },
                        onCodeChanged: (code) {
                          debugPrint("onCodeSubmitted $code");
                          otpTextEditingController.text = code ?? "";
                          otpVal = code ?? "";
                          /*if (code.toString().length == 4) {
                            debugPrint("onCodeSubmitted $code");
                            otpTextEditingController.text = code ?? "";
                            otpVal = code ?? "";
                          }*/
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "[${argumentData['id']}]",
                          style: TextStyles(context).googleRubikFontsForText(fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        InkWell(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          onTap: () {
                            otpVal = "";
                            otpTextEditingController.text="";
                            setState(() {

                            });
                            sendOtp();
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
                      buttonText: "Verify & Reset Password",
                      backgroundColor: const Color(0xFF2CBFD3),
                      radius: 30,
                      height: 48,
                      onTap: () {

                        // NavigationServices(context).gotoTabScreen();
                        verifyOtp();
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
                            sendOtp();
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

  verifyOtp() {
    try {
      Utils.showProgressIndicator();
      // userId = await sharedPref.getKey("userId")??"";

      Map<String, dynamic> postData = (!argumentData['isMobile'])
          ? {"EmailAddress": argumentData['id'], "OTP": otpVal}
          : {"MobileNumber": argumentData['id'], "OTP": otpVal};
      debugPrint(">>>>>>postData$postData");
      HttpMethodsDio().postMethod(
          api: ApiEndPoint.forGotPasswordVerifyOtp,
          fun: (map, code) {
            Utils.disMissProgressIndicator();
            if (code == 200) {
               postData.remove("OTP") ;
              debugPrint(">>>>>>postData$postData");
              Navigator.pushNamed(context, "/changePassword",arguments: postData);
            } else if (map is Map && map.containsKey("message")) {
              ShowSnackBar.showError(context, map["message"] ?? "Something went wrong");
            } else {
              ShowSnackBar.showError(context, "$map");
            }
          },
          json: postData);
    } catch (e) {
      Utils.disMissProgressIndicator();
      debugPrint(">>>>>>>>>>exception$e");
    }
  }

  sendOtp(){
    try {
      Utils.showProgressIndicator();
      Map<String, dynamic> postData = (Utils.checkIsDouble(argumentData['id']) == false)?{
        "EmailAddress": argumentData['id']
      }:{
        "MobileNumber": argumentData['id']
      };
      debugPrint(">>>postData$postData");
      Utils.disMissProgressIndicator();
      HttpMethodsDio().postMethod(api:ApiEndPoint.forgotPasswordSendVerification, fun: (map,code) {
        // Navigator.pushNamed(context, "/forgotPasswordOtp");
        if(code == 200){

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
