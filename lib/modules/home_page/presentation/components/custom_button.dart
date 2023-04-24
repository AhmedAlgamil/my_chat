import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.buttonText,
    this.height,
    this.width,
    this.onPressedButton,
  }) : super(key: key);

  String? buttonText;
  double? width;
  double? height;
  GestureTapCallback? onPressedButton;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Ink(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: themeData.buttonColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onPressedButton,
        borderRadius: BorderRadius.circular(10),
        splashColor: themeData.splashColor,
        child: Center(
          child: Text(
            buttonText!,
            style: themeData.accentTextTheme.button,
          ),
        ),
      ),
    );
  }
}
