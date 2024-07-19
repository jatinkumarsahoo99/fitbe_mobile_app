import 'package:flutter/material.dart';

import '../app_theme/text_styles.dart';

class CommonDateFieldView extends StatelessWidget {
  final String? titleText;
  final int? maxLength;
  final String hintText;
  final String? errorText;
  final bool isObscureText, isAllowTopTitleView;
  final bool? enable;
  final EdgeInsetsGeometry padding;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final double? pad;
  final double? height;
  final double? radius;
  final BuildContext? contextNew;

  const CommonDateFieldView(
      {super.key,
        this.hintText = '',
        this.isObscureText = false,
        this.padding =
        const EdgeInsets.only(bottom: 0, right: 0, top: 0, left: 0),
        this.onChanged,
        this.keyboardType = TextInputType.text,
        this.isAllowTopTitleView = true,
        this.errorText,
        this.titleText = '',
        this.controller,
        this.maxLength,
        this.pad = 16,
        this.radius = 10,
        this.contextNew,
        this.height = 40,
        this.enable = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isAllowTopTitleView && titleText != '')
            Text(
              titleText ?? "",
              style: TextStyles(context)
                  .googleRubikFontsForSecondaryText(fontSize: 11),
            ),
          SizedBox(
            height: height ?? 48,
            child: Center(
              child: TextField(
                controller: controller,
                maxLines: 1,
                enabled: enable,
                onChanged: onChanged,
                maxLength: maxLength ?? 50,
                style: TextStyles(context).googleRubikFontsForText(fontWeight: FontWeight.w400,fontSize: 12),
                obscureText: isObscureText,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    errorText: null,
                    counterText: "",
                    // border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: TextStyles(context).googleRubikFontsForText(fontWeight: FontWeight.w400,fontSize: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(radius??10),
                        borderSide: const BorderSide(color: Color(0xFFF4F6F9),width: 0.04)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(radius??10),
                        borderSide: const BorderSide(color: Color(0xFFF4F6F9),width: 0.04)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(radius??10),
                        borderSide: const BorderSide(color: Color(0xFFF4F6F9),width: 0.04)
                    ),
                    fillColor: const Color(0xFFF4F6F9),
                    contentPadding: const EdgeInsets.only(left: 16,right: 14,top: 9,bottom: 9),
                    filled: true
                ),
                keyboardType: keyboardType,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
