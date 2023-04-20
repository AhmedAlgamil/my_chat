import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat/modules/auth/data/cubit/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(IntialAuthState());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  bool passwordIsShowen = false;

  // void getNews() {
  //   DioHelper.getData(
  //     url: "top-headlines",
  //     parameters:{
  //       "apiKey":"4b44be43212c4495bec89cbad53fd10e",
  //       "country":"eg",
  //     },
  //   ).then((value) {
  //     newsModel=NewsModel.fromJson(value.data);
  //   });
  // }

  void m

  void showPassword(bool isShowen) {
    passwordIsShowen = isShowen;
    emit(IntialAuthState());
  }

  void makeLogin(String? phone, String password) {}
}
