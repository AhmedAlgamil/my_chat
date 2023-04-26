import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    required this.hintText,
    this.myController,
    this.myPrefixIcon,
    this.errorText,
    this.width,
    this.height,
    this.onPressedSuffixIcon,
    this.myKeyboardType,
    this.textFieldIcon,
    this.isAlignCenter = false,
    this.isObSecure = true,
  }) : super(key: key);

  String? hintText;
  String? errorText;
  VoidCallback? onPressedSuffixIcon;
  bool isAlignCenter;
  bool isObSecure;
  double? width;
  double? height;
  IconData? myPrefixIcon;
  IconData? textFieldIcon;
  TextInputType? myKeyboardType;
  TextEditingController? myController;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      width: width,
      height: height,
      child: TextFormField(
        controller: myController,
        keyboardType: myKeyboardType,
        textAlign: isAlignCenter ? TextAlign.center : TextAlign.start,
        cursorColor: Colors.white,
        style: themeData.textTheme.headline3,
        obscureText: myKeyboardType != TextInputType.visiblePassword
            ? false
            : isObSecure,
        decoration: InputDecoration(
          filled: true,
          //<-- SEE HERE
          icon: textFieldIcon == null ? null : Icon(textFieldIcon),
          iconColor: themeData.backgroundColor,
          hintText: hintText,
          fillColor: themeData.accentColor,
          suffixIconColor: themeData.accentColor,
          prefixIcon: textFieldIcon != null
              ? null
              : (myPrefixIcon == null ? null : Icon(myPrefixIcon)),
          errorText: errorText,
          suffixIcon: myKeyboardType != TextInputType.visiblePassword
              ? null
              : IconButton(
                  onPressed: onPressedSuffixIcon,
                  splashRadius: 20,
                  icon: isObSecure
                      ? Icon(
                          Icons.visibility_off,
                          color: themeData.primaryColorLight,
                        )
                      : Icon(
                          Icons.visibility,
                          color: themeData.primaryColorLight,
                        ),
                ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: themeData.errorColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          // fillColor: ,
          prefixIconColor: themeData.accentColor,
          hintStyle: themeData.textTheme.headline3,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: themeData.accentColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: themeData.accentColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: themeData.accentColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
