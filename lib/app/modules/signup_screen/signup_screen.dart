import 'package:fitbe/app/app_utils/utils.dart';
import 'package:fitbe/app/modules/signup_screen/provider/sign_up_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_api_services/api_end_point.dart';
import '../../app_api_services/http_methods.dart';
import '../../app_theme/text_styles.dart';
import '../../common_widgets/common_button.dart';
import '../../common_widgets/common_password_text_field.dart';
import '../../common_widgets/common_text_field_view.dart';
import '../../common_widgets/header_text_widget.dart';
import '../../common_widgets/remove_focuse.dart';
import '../../common_widgets/show_snack_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpProvider(),
      child: const SignUpScreen(),
    );
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailIdController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isCheck = false;

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
                    headerText: "Create Account",
                    headDesc: "Fill The Details To Create An Account",
                    key: UniqueKey(),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CommonTextFieldView(
                    controller: fullNameController,
                    // errorText: _errorFName,
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    titleText: "Full Name",
                    hintText: "Full Name",
                    keyboardType: TextInputType.name,
                    onChanged: (String txt) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonTextFieldView(
                    controller: emailIdController,
                    errorText: "",
                    titleText: "Email ID",
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    hintText: "Email ID",
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (String txt) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonTextFieldView(
                    controller: mobileController,
                    errorText: "",
                    titleText: "Mobile Number",
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    hintText: "Mobile Number",
                    keyboardType: TextInputType.number,
                    maxLength: 10,
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
                    errorText: "",
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          value: isCheck,
                          onChanged: (sta) {
                            isCheck = !isCheck;
                            setState(() {});
                          },
                          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                          activeColor: const Color(0xFF2CBFD3),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          "I Agree With",
                          style: TextStyles(context).googleRubikFontsForHeading(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Terms & Conditions",
                          style: TextStyles(context).googleRubikFontsForText2(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CommonButton(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    buttonText: "SignUp",
                    onTap: () {
                      if (validate()) {
                        callSignUpApi();

                      }
                      // NavigationServices(context).gotoTabScreen();
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
                          Navigator.pushNamed(context, "/signInScreen");
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
    );
  }

  bool validate() {
    if (fullNameController.text == "") {
      ShowSnackBar.showError(context, "Please enter the full name");
    } else if (emailIdController.text == "") {
      ShowSnackBar.showError(context, "Please enter the email");
    } else if (!emailIdController.text.isValidEmail()) {
      ShowSnackBar.showError(context, "Please enter the valid email");
    } else if (mobileController.text == "") {
      ShowSnackBar.showError(context, "Please enter the mobile");
    } else if (mobileController.text.length < 10) {
      ShowSnackBar.showError(context, "Please enter the valid mobile no");
    } else if (passwordController.text == "") {
      ShowSnackBar.showError(context, "Please enter your password");
    } else if(isCheck == false){
      ShowSnackBar.showError(context, "Please accept term & condition");
    }else {
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
  callSignUpApi() {
    try {
      Utils.showProgressIndicator();
      Map<String, dynamic> postData = {
        "FullName": fullNameController.text,
        "EmailAddress": emailIdController.text,
        "MobileNumber": mobileController.text,
        "Password":passwordController.text,
        "DateOfBirth": "1998-08-20",
      };
      HttpMethodsDio().postMethod(api: ApiEndPoint.signUpUrl, json: postData, fun: (map,code)  {
        Utils.disMissProgressIndicator();
        if(map is Map && map.containsKey("data") && map['data'] is Map && map['data'].containsKey("userId")) {
          // await sharedPref.save("userId",map['data']["userId"] );
          postData['userId'] = map['data']["userId"];
          Navigator.pushNamedAndRemoveUntil(context, "/verificationScreen",arguments: postData, (Route<dynamic> route) => false,);
        }else if(map is Map && map.containsKey("message")){
          ShowSnackBar.showError(context, map["message"]??"Something went wrong");
        }else{
          ShowSnackBar.showError(context, "$map");
        }
      });
    }catch(e){
      debugPrint("exception:$e");
      Utils.disMissProgressIndicator();
    }
  }
}
