import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat/modules/auth/presentation/screens/signup_screen.dart';
import 'package:my_chat/shared/local/shared_prefrence.dart';

import '../../../../generated/l10n.dart';
import '../../../home_page/presentation/screens/home_page_screen.dart';
import '../store/auth_cubit.dart';
import '../store/auth_states.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  TextEditingController phoneController = TextEditingController();

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
                  textDirection: TextDirection.rtl,
                  children: [
                    SizedBox(
                      height: mq.size.height * 0.02,
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        padding: EdgeInsets.only(left: mq.size.width * 0.1,),
                        child: Text(
                          S.of(context).HelloThere,
                          style: thData.textTheme.headline4,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: mq.size.width * 0.1,),
                      child: Text(
                        S.of(context).welcomeBack,
                        style: thData.textTheme.headline2,
                      ),
                    ),
                    SizedBox(
                      height: mq.size.height * 0.04,
                    ),
                    CustomTextFormField(
                      width: mq.size.width * 0.8,
                      height: mq.size.height * 0.07,
                      hintText: S.of(context).phoneNumber,
                      myKeyboardType: TextInputType.phone,
                      myController: phoneController,
                      errorText: cubit.errorPhoneValidator,
                    ),
                    SizedBox(
                      height: mq.size.height * 0.02,
                    ),
                    CustomButton(
                      width: mq.size.width * 0.8,
                      height: mq.size.height * 0.06,
                      buttonText: S.of(context).forgetPassword,
                      onPressedButton: () {
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
