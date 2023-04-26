import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    required this.hintText,
    this.myController,
    this.myPrefixIcon,
    this.errorText,
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
  IconData? myPrefixIcon;
  IconData? textFieldIcon;
  TextInputType? myKeyboardType;
  TextStyle myTextStyle = const TextStyle(color: Colors.white, fontSize: 17);
  TextEditingController? myController;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return TextFormField(
      controller: myController,
      keyboardType: myKeyboardType,
      textAlign: isAlignCenter ? TextAlign.center : TextAlign.start,
      cursorColor: themeData.primaryColorLight,
      style: myTextStyle,
      obscureText: myKeyboardType != TextInputType.visiblePassword ? false : isObSecure,
      decoration: InputDecoration(
        icon: textFieldIcon == null ? null : Icon(textFieldIcon),
        iconColor: themeData.accentColor,
        hintText: hintText,
        suffixIconColor: themeData.accentColor,
        prefixIcon: textFieldIcon != null ? null : ( myPrefixIcon == null ? null : Icon(myPrefixIcon)),
        errorText: errorText,
        suffixIcon: myKeyboardType != TextInputType.visiblePassword ? null : IconButton(
            onPressed: onPressedSuffixIcon,
            icon: isObSecure
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility)),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: themeData.errorColor, width: 1),
        ),
        fillColor: themeData.accentColor,
        prefixIconColor: themeData.accentColor,
        hintStyle: myTextStyle,
        border: UnderlineInputBorder(
          borderSide:
              BorderSide(color: themeData.accentColor, width: 1),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: themeData.accentColor, width: 1),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: themeData.accentColor, width: 1),
        ),
      ),
    );
  }
}
