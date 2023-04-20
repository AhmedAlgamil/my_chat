import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat/modules/auth/presentation/screens/signup_screen.dart';

import '../../data/cubit/auth_states.dart';
import '../../data/cubit/cubit.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    ThemeData thData = Theme.of(context);
    return BlocProvider(
      create: (context) {
        return AuthCubit();
      },
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
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
                      isAlignCenter: true,
                      myPrefixIcon: Icons.phone,
                      myKeyboardType: TextInputType.number,
                      isObSecure: cubit.passwordIsShowen,
                    ),
                    SizedBox(
                      height: mq.size.height * 0.07,
                    ),
                    CustomTextFormField(
                      hintText: "Password",
                      isAlignCenter: true,
                      myPrefixIcon: Icons.lock,
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
                      onPressedButton: () {},
                    ),
                    SizedBox(
                      height: mq.size.height * 0.07,
                    ),
                    GestureDetector(
                      child: Text(
                        "Forget Password?",
                        style: thData.textTheme.headline4,
                      ),
                      onTap: () {},
                    ),
                    SizedBox(
                      height: mq.size.height * 0.1,
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
