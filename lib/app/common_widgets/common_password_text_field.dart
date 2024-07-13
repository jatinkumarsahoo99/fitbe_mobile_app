import 'package:flutter/material.dart';
import '../app_theme/text_styles.dart';

class CommonPasswordTextFieldView extends StatefulWidget {
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

  const CommonPasswordTextFieldView(
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
  State<CommonPasswordTextFieldView> createState() => _CommonPasswordTextFieldViewState();
}

class _CommonPasswordTextFieldViewState extends State<CommonPasswordTextFieldView> {
  bool isVisible  = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.isAllowTopTitleView && widget.titleText != '')
            Text(
              widget.titleText ?? "",
              style: TextStyles(context)
                  .googleRubikFontsForSecondaryText(fontSize: 11),
            ),
          SizedBox(
            height: widget.height ?? 48,
            child: Center(
              child: TextField(
                controller: widget.controller,
                maxLines: 1,
                enabled: widget.enable,
                onChanged: widget.onChanged,
                maxLength: widget.maxLength ?? 50,
                style: TextStyles(context).googleRubikFontsForText(fontWeight: FontWeight.w400,fontSize: 12),
                obscureText: isVisible,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    errorText: null,
                    counterText: "",
                    // border: InputBorder.none,
                    hintText: widget.hintText,
                    hintStyle: TextStyles(context).googleRubikFontsForText(fontWeight: FontWeight.w400,fontSize: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(widget.radius??10),
                        borderSide: const BorderSide(color: Color(0xFFF4F6F9),width: 0.04)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(widget.radius??10),
                        borderSide: const BorderSide(color: Color(0xFFF4F6F9),width: 0.04)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(widget.radius??10),
                        borderSide: const BorderSide(color: Color(0xFFF4F6F9),width: 0.04)
                    ),
                    fillColor: const Color(0xFFF4F6F9),
                    contentPadding: const EdgeInsets.only(left: 16,right: 0,top: 9,bottom: 9),
                    filled: true,
                    suffixIcon: GestureDetector(
                        onTap: (){
                          isVisible = !isVisible;
                          setState(() {});
                        },
                        child: Icon((isVisible)? Icons.visibility_outlined:Icons.visibility_off_outlined,size: 20,color: const Color(0xFF2CBFD3),))
                ),
                keyboardType: widget.keyboardType,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
