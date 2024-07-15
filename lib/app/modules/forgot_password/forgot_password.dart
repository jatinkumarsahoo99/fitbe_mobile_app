import 'package:fitbe/app/app_utils/utils.dart';
import 'package:flutter/material.dart';

import '../../app_api_services/api_end_point.dart';
import '../../app_api_services/http_methods.dart';
import '../../app_theme/text_styles.dart';
import '../../common_widgets/common_button.dart';
import '../../common_widgets/common_text_field_view.dart';
import '../../common_widgets/header_text_widget.dart';
import '../../common_widgets/remove_focuse.dart';
import '../../common_widgets/show_snack_bar.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  TextEditingController emailIdOrMobileNoController = TextEditingController();
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
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:16.0,right: 16),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                border:
                                Border.all(color: Colors.grey, width: 0.1),
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
                  ),
                  Expanded(
                      flex: 3,
                      child:Container()),
                  HeaderTextWidget(
                    headerText: "Forgot Password",
                    headDesc: "Enter Your Email Or Mobile Number To Receive OTP",
                    key: UniqueKey(),
                  ),
                  CommonTextFieldView(
                    controller: emailIdOrMobileNoController,
                    // errorText: _errorFName,
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    titleText: "Email ID Or Mobile Number",
                    hintText:"Email ID Or Mobile Number",
                    keyboardType: TextInputType.name,
                    onChanged: (String txt) {},
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  CommonButton(
                    padding:
                    const EdgeInsets.only(left: 16, right: 16),
                    buttonText: "Send OTP",
                    onTap: () {
                      validate();

                      // NavigationServices(context).gotoTabScreen();
                    },
                  ),
                  Expanded(
                      flex: 7,
                      child:Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Don't Have An Account? ",
                        textAlign: TextAlign.center,
                        style: TextStyles(context).googleRubikFontsForHeading(fontSize: 14,fontWeight: FontWeight.w400),
                      ),
                      InkWell(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        onTap: () {
                          Navigator.pushNamed(context, "/signInScreen");
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Sign In",
                            style:TextStyles(context).googleRubikFontsForText2(fontSize: 14,fontWeight: FontWeight.w500),
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

  validate(){
    dynamic status = Utils.checkUserId(emailIdOrMobileNoController.text);
    debugPrint(">>>>>status$status");
    if(status == true){
      callForGotPasswordApi();

    }else{
      ShowSnackBar.showError(context, status??"Something went wrong");
    }
  }

  callForGotPasswordApi(){
    try {
      Utils.showProgressIndicator();
      Map<String, dynamic> postData = (Utils.checkIsDouble(emailIdOrMobileNoController.text) == false)?{
        "EmailAddress": emailIdOrMobileNoController.text
      }:{
        "MobileNumber": emailIdOrMobileNoController.text
      };
      Utils.disMissProgressIndicator();
      HttpMethodsDio().postMethod(api:ApiEndPoint.forgotPasswordSendVerification, fun: (map,code) {
        // Navigator.pushNamed(context, "/forgotPasswordOtp");
        if(code == 200){
          Navigator.pushNamed(context, "/forgotPasswordOtp",arguments: {
            "id":emailIdOrMobileNoController.text,
            "isMobile":Utils.checkIsDouble(emailIdOrMobileNoController.text)
          });
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
