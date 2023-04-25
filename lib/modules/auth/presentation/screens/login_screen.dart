import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat/modules/auth/presentation/screens/signup_screen.dart';
import 'package:my_chat/shared/local/shared_prefrence.dart';

import '../../../home_page/presentation/screens/home_page_screen.dart';
import '../store/auth_cubit.dart';
import '../store/auth_states.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  DateTime ondate = DateTime.now();

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
              MyChatSharedPrefrence.setBool("isLogedIn", true);
              MyChatSharedPrefrence.setString(
                  "myId", AuthCubit.get(context).authModel!.data![0].id);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePageScreen(),
                  ),
                  (route) => false);
            } else {
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
              child: Container(
                width: mq.size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: mq.size.height * 0.02,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: mq.size.width * 0.1,),
                      child: Text(
                        "Hello There",
                        style: thData.textTheme.headline4,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: mq.size.width * 0.1,),
                      child: Text(
                        "Welcome Back",
                        style: thData.textTheme.headline2,
                      ),
                    ),
                    SizedBox(
                      height: mq.size.height * 0.04,
                    ),
                    CustomTextFormField(
                      width: mq.size.width * 0.8,
                      hintText: "Phone Number",
                      myKeyboardType: TextInputType.number,
                      myController: phoneController,
                      errorText: cubit.errorPhoneValidator,
                    ),
                    SizedBox(
                      height: mq.size.height * 0.02,
                    ),
                    CustomTextFormField(
                      width: mq.size.width * 0.8,
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
                      height: mq.size.height * 0.01,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: mq.size.width * 0.1),
                      child: GestureDetector(
                        child: Text(
                          "Forget Password?",
                          style: thData.textTheme.headline5,
                        ),
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      height: mq.size.height * 0.35,
                    ),
                    CustomButton(
                      width: mq.size.width * 0.8,
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
                      height: mq.size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don\'t Have Account?",
                          style: thData.textTheme.headline4,
                        ),
                        GestureDetector(
                          child: Text(
                            "SIGN UP",
                            style: thData.textTheme.headline5,
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
