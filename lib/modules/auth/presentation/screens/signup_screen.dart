import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/cubit/auth_states.dart';
import '../../data/cubit/cubit.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: mq.size.height * 0.02,
                    ),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 70,
                        ),
                        FloatingActionButton(
                          onPressed: () {},
                          child: Icon(Icons.image),
                        )
                      ],
                    ),
                    SizedBox(
                      height: mq.size.height * 0.04,
                    ),
                    Text(
                      "Create Your Account ",
                      style: thData.textTheme.headline4,
                    ),
                    SizedBox(
                      height: mq.size.height * 0.04,
                    ),
                    CustomTextFormField(
                      hintText: "Full Name",
                      textFieldIcon: Icons.person,
                      myKeyboardType: TextInputType.text,
                      isObSecure: cubit.passwordIsShowen,
                    ),
                    SizedBox(
                      height: mq.size.height * 0.04,
                    ),
                    CustomTextFormField(
                      hintText: "Phone Number",
                      textFieldIcon: Icons.phone,
                      myKeyboardType: TextInputType.number,
                      isObSecure: cubit.passwordIsShowen,
                    ),
                    SizedBox(
                      height: mq.size.height * 0.04,
                    ),
                    CustomTextFormField(
                      hintText: "Email",
                      textFieldIcon: Icons.email,
                      myKeyboardType: TextInputType.emailAddress,
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
                      height: mq.size.height * 0.04,
                    ),
                    CustomTextFormField(
                      hintText: "Password",
                      textFieldIcon: Icons.lock,
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
                      height: mq.size.height * 0.04,
                    ),
                    CustomButton(
                      width: mq.size.width * 0.6,
                      height: mq.size.height * 0.06,
                      buttonText: "Sign Up",
                      onPressedButton: () {},
                    ),
                    SizedBox(
                      height: mq.size.height * 0.04,
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
