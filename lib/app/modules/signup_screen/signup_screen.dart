import 'package:flutter/material.dart';

import '../../app_theme/text_styles.dart';
import '../../common_widgets/common_button.dart';
import '../../common_widgets/common_password_text_field.dart';
import '../../common_widgets/common_text_field_view.dart';
import '../../common_widgets/remove_focuse.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final String _errorEmail = '';
  final TextEditingController _emailController = TextEditingController();
  final String _errorPassword = '';
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fnameController = TextEditingController();

  bool isCheck = true;

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
                  Padding(
                    padding: const EdgeInsets.only(left: 76.0,right: 76,top: 0,bottom: 0),
                    child: Text(
                      "Create Account",
                      textAlign: TextAlign.center,
                      style: TextStyles(context).googleRubikFontsForHeading(fontSize: 18,fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 76.0,right: 76,top: 0,bottom: 0),
                    child: Text(
                      "Fill The Details To Create An Account",
                      textAlign: TextAlign.center,
                      style: TextStyles(context).googleRubikFontsForText(fontSize: 10,fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),

                  CommonTextFieldView(
                    controller: _fnameController,
                    // errorText: _errorFName,
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    titleText: "Full Name",
                    hintText:"Full Name",
                    keyboardType: TextInputType.name,
                    onChanged: (String txt) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonTextFieldView(
                    controller: _emailController,
                    errorText: _errorEmail,
                    titleText: "Email ID",
                    padding: const EdgeInsets.only(
                        left: 16, right: 16),
                    hintText:"Email ID",
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (String txt) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonTextFieldView(
                    controller: _emailController,
                    errorText: _errorEmail,
                    titleText: "Mobile Number",
                    padding: const EdgeInsets.only(
                        left: 16, right: 16),
                    hintText:"Mobile Number",
                    keyboardType: TextInputType.number,
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
                    errorText: _errorPassword,
                    controller: _passwordController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,),
                    child: Row(
                      children: [
                        Checkbox(value: isCheck,
                          onChanged: (sta){
                            isCheck = !isCheck;
                            setState(() {

                            });
                        },visualDensity: const VisualDensity(horizontal: -4,vertical: -4),
                        activeColor: const Color(0xFF2CBFD3),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text("I Agree With",style:TextStyles(context).googleRubikFontsForHeading(fontSize: 14,fontWeight: FontWeight.w400) ,),
                        const SizedBox(
                          width: 8,
                        ),
                        Text("Terms & Conditions",
                          style:TextStyles(context).googleRubikFontsForText2(fontSize: 14), ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CommonButton(
                    padding:
                    const EdgeInsets.only(left: 16, right: 16),
                    buttonText: "SignUp",
                    onTap: () {
                      Navigator.pushNamed(context, "/verificationScreen");
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
                        "Already Have An Account? ",
                        textAlign: TextAlign.center,
                        style: TextStyles(context).googleRubikFontsForHeading(fontSize: 14,fontWeight: FontWeight.w400),
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
}