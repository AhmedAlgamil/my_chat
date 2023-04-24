import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat/modules/auth/presentation/screens/signup_screen.dart';

import '../../../home_page/presentation/screens/home_page_screen.dart';
import '../store/auth_cubit.dart';
import '../store/auth_states.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    ThemeData thData = Theme.of(context);
    return BlocProvider(
      create: (context) {
        return AuthCubit();
      },
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LoginLoadedSuccessState) {
            if (AuthCubit.get(context).authModel!.status == "true") {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePageScreen(),
                  ),
                      (route) => false);
            }
            else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: thData.errorColor,
                  content: Text(AuthCubit.get(context).authModel!.message!),
                ),
              );
            }
          }
        },
        builder: (context, state) {
          AuthCubit cubit = AuthCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            backgroundColor: thData.backgroundColor,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: mq.size.height * 0.02,
                    ),
                    FlutterLogo(
                      size: 100,
                    ),
                    SizedBox(
                      height: mq.size.height * 0.07,
                    ),
                    CustomTextFormField(
                      hintText: "Phone Number",
                      myKeyboardType: TextInputType.number,
                      myController: phoneController,
                      errorText: cubit.errorPhoneValidator,
                    ),
                    SizedBox(
                      height: mq.size.height * 0.07,
                    ),
                    CustomTextFormField(
                      hintText: "Password",
                      myController: passwordController,
                      errorText: cubit.errorPasswordValidator,
                      myKeyboardType: TextInputType.visiblePassword,
                      onPressedSuffixIcon: () {
                        if (cubit.passwordIsShowen) {
                          cubit.showPassword(false);
                        } else {
                          cubit.showPassword(true);
                        }
                      },
                      isObSecure: cubit.passwordIsShowen,
                    ),
                    SizedBox(
                      height: mq.size.height * 0.07,
                    ),
                    CustomButton(
                      width: mq.size.width * 0.6,
                      height: mq.size.height * 0.06,
                      buttonText: "Login",
                      onPressedButton: () {
                        cubit.makeLogin(
                          phoneController.text,
                          passwordController.text,
                        );
                      },
                    ),
                    SizedBox(
                      height: mq.size.height * 0.04,
                    ),
                    GestureDetector(
                      child: Text(
                        "Forget Password?",
                        style: thData.textTheme.headline4,
                      ),
                      onTap: () {},
                    ),
                    SizedBox(
                      height: mq.size.height * 0.06,
                    ),
                    GestureDetector(
                      child: Text(
                        "SIGN UP",
                        style: thData.textTheme.headline4,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
