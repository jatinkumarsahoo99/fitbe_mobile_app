import 'package:fitbe/app/app_utils/utils.dart';
import 'package:flutter/material.dart';

import '../app_theme/text_styles.dart';
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

class _SigninScreenState extends State<SigninScreen> {

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
                  Expanded(
                      flex: 3,
                      child:Container()),

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
                    hintText:"Email ID Or Mobile Number",
                    keyboardType: TextInputType.name,
                    onChanged: (String txt) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonPasswordTextFieldView(
                    titleText:"Password",
                    padding: const EdgeInsets.only(
                        left: 16, right: 16),
                    hintText:"Password",
                    isObscureText: true,
                    onChanged: (String txt) {},
                    // errorText: _errorPassword,
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8)),
                          onTap: () {
                            // NavigationServices(context).gotoLoginScreen();
                            Navigator.pushNamed(context, "/forgotPassword");
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "Forgot Password",
                              style: TextStyles(context)
                                  .googleRubikFontsForText2(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
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
                    padding:
                    const EdgeInsets.only(left: 16, right: 16),
                    buttonText: "Sign In",
                    onTap: () {

                      // NavigationServices(context).gotoTabScreen();
                      if(validate()){
                        Navigator.pushNamed(context, "/preferenceScreen");
                      }
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
                          Navigator.pushNamed(context, "/signupScreen");
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Sign Up",
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

  bool validate(){
    if(emailIdOrMobileController.text == ""){
      ShowSnackBar.showError(context, "Please enter the email or mobile");
    }else if(passwordController.text == ""){
      ShowSnackBar.showError(context, "Please enter your password");
    }else if(!checkUserId(emailIdOrMobileController.text)){
      ShowSnackBar.showError(context, "Please enter valid email Id or Password");
    }else{
      return true;
    }
    return false;
  }

  bool checkUserId(String userId){
    try{
      if(double.parse(userId).runtimeType == double && userId.length == 10){
        return true;
      }else{
        return false;
      }
    }catch(e){
      if(userId.isValidEmail()){
        return true;
      }else{
        return false;
      }
      debugPrint(">>>>>>>>>>>>>exception$e");
    }
  }

}
