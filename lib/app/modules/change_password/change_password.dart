import 'package:flutter/material.dart';

import '../../app_api_services/api_end_point.dart';
import '../../app_api_services/http_methods.dart';
import '../../app_theme/text_styles.dart';
import '../../common_widgets/common_button.dart';
import '../../common_widgets/common_password_text_field.dart';
import '../../common_widgets/remove_focuse.dart';
import '../../common_widgets/show_snack_bar.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController = TextEditingController();

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
                  Padding(
                    padding: const EdgeInsets.only(left: 76.0,right: 76,top: 0,bottom: 0),
                    child: Text(
                      "Change Password",
                      textAlign: TextAlign.center,
                      style: TextStyles(context).googleRubikFontsForHeading(fontSize: 18,fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16,top: 0,bottom: 0),
                    child: Text(
                      "Enter New Password",
                      textAlign: TextAlign.center,
                      style: TextStyles(context).googleRubikFontsForText(fontSize: 10,fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CommonPasswordTextFieldView(
                    titleText:"New Password",
                    padding: const EdgeInsets.only(
                        left: 16, right: 16),
                    hintText:"New Password",
                    isObscureText: true,
                    onChanged: (String txt) {},
                    errorText: null,
                    controller: passwordTextEditingController,
                  ),
                  CommonPasswordTextFieldView(
                    titleText:"Confirm New Password",
                    padding: const EdgeInsets.only(
                        left: 16, right: 16),
                    hintText:"Confirm New Password",
                    isObscureText: true,
                    onChanged: (String txt) {},
                    errorText: null,
                    controller: confirmPasswordTextEditingController,
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  CommonButton(
                    padding:
                    const EdgeInsets.only(left: 16, right: 16),
                    buttonText: "Create New Password",
                    onTap: () {
                      validate();

                      // NavigationServices(context).gotoTabScreen();
                    },
                  ),
                  Expanded(
                      flex: 7,
                      child:Container()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  validate(){
    if(passwordTextEditingController.text.trim() == ""){
      ShowSnackBar.showError(context, "Please enter the password");
    }else if(confirmPasswordTextEditingController.text.trim() == ""){
      ShowSnackBar.showError(context, "Please enter the confirm password");
    }else if(passwordTextEditingController.text != confirmPasswordTextEditingController.text){
      ShowSnackBar.showError(context, "Password and confirm password should be same");
    }else{
      Navigator.pushNamed(context, "/signInScreen");
      callChangePasswordApi();
    }
  }

  callChangePasswordApi(){
    HttpMethodsDio().postMethod(api: ApiEndPoint.signUpUrl, json: {
      "password": "new password"
    }, fun: (map,code) {
      Navigator.pushNamed(context, "/verificationScreen");
    });
  }


}
