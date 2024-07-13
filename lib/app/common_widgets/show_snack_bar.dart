import 'package:flutter/material.dart';

import '../app_theme/text_styles.dart';

class ShowSnackBar{
  static showError(BuildContext context,String? message){
    final snackBar = SnackBar(
      content:  Text(message??'Error',style: TextStyles(context).googleRubikFontsForButtonText(fontWeight: FontWeight.w200,fontSize: 13),),
      backgroundColor: const Color(0xFF2CBFD3),
      duration: const Duration(seconds: 3),
      // showCloseIcon: true,

      action: SnackBarAction(
        label: 'Ok',
        textColor: Colors.white,
        onPressed: () {
          // Perform some action
          // Navigator.pop(context);
        },
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}