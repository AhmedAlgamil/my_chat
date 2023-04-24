import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../store/auth_cubit.dart';
import '../store/auth_states.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  TextEditingController fullNameController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController emailAddressController = new TextEditingController();
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
                          // backgroundImage: NetworkImage(cubit.image == null ? "" :cubit.image!.path),
                          backgroundImage: FileImage(cubit.image == null ? File("") :cubit.image!),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: mq.size.height * 0.15,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Ink(
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              onTap: () {},
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      size: mq.size.width * 0.15,
                                                      Icons.camera,
                                                    ),
                                                    Text(
                                                      "Take photo",
                                                      style: thData
                                                          .textTheme.headline3,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Ink(
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              onTap: () {
                                                cubit.pickImage();
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      size: mq.size.width * 0.15,
                                                      Icons.image,
                                                    ),
                                                    Text(
                                                      "Select image",
                                                      style: thData
                                                          .textTheme.headline3,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: const Icon(Icons.image),
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
                      myController: fullNameController,
                      myKeyboardType: TextInputType.text,
                      errorText: cubit.errorFullName,
                    ),
                    SizedBox(
                      height: mq.size.height * 0.04,
                    ),
                    CustomTextFormField(
                      hintText: "Phone Number",
                      myController: phoneNumberController,
                      myKeyboardType: TextInputType.number,
                      errorText: cubit.errorPhoneValidator,
                    ),
                    SizedBox(
                      height: mq.size.height * 0.04,
                    ),
                    CustomTextFormField(
                      hintText: "Email",
                      myController: emailAddressController,
                      myKeyboardType: TextInputType.emailAddress,
                      errorText: cubit.errorEmailAddress,
                    ),
                    SizedBox(
                      height: mq.size.height * 0.04,
                    ),
                    CustomTextFormField(
                      hintText: "Password",
                      myController: passwordController,
                      myKeyboardType: TextInputType.visiblePassword,
                      errorText: cubit.errorPasswordValidator,
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
                      onPressedButton: () {
                        cubit.makeSignUp(
                            fullNameController.text,
                            phoneNumberController.text,
                            emailAddressController.text,
                            passwordController.text,
                            cubit.image!);
                      },
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
