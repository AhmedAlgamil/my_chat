import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_chat/modules/auth/data/models/auth_model.dart';
import 'package:my_chat/modules/auth/data/repository/auth_repository.dart';
import 'package:my_chat/modules/auth/presentation/store/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(IntialAuthState());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  bool passwordIsShowen = true;
  String? errorMessage = "";
  String? errorPhoneValidator;

  String? errorPasswordValidator;

  String? errorFullName;

  String? errorEmailAddress;

  AuthRepository authRepository = AuthRepository();

  AuthModel? authModel;
  File? image, photo;

  void showPassword(bool isShowen) {
    passwordIsShowen = isShowen;
    emit(IntialAuthState());
  }

  void makeLogin(String? phone, String? password) {
    emit(LoginState());
    if (phone!.isEmpty && password!.isEmpty) {
      errorPhoneValidator = "Please enter phone number";
      errorPasswordValidator = "Please enter password";
    } else {
      if (password!.length < 8) {
        errorPasswordValidator = "it must have at least 8 digits";
      } else {
        errorPasswordValidator = null;
      }
      String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
      RegExp regExp = RegExp(pattern);
      if (!regExp.hasMatch(phone)) {
        errorPhoneValidator = 'Please enter valid mobile number';
      } else {
        errorPhoneValidator = null;
      }
    }
    if (errorPhoneValidator == null && errorPasswordValidator == null) {
      authRepository
          .login(
        phoneNumber: phone,
        password: password,
      )
          .then(
        (value) {
          emit(LoginLoadedSuccessState());
          authModel = value;
        },
      ).catchError((e) {
        emit(LoginFailedState());
        if (e is DioError) {
          if (e.message.contains("SocketException")) {
            // print(e.message);
            emit(LoginFailedState());
            errorMessage = "You are offline";
          }
        }
      });
    }
  }

  Future pickImage() async {
    try {
      emit(InitialSelectImage());
      final ImagePicker picker = ImagePicker();
      final XFile? myImage =
          await picker.pickImage(source: ImageSource.gallery);
      if (myImage == null) return;
      File imageFile = File(myImage.path);
      image = imageFile;
      emit(InitialSelectImage());
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  Future takePhoto() async {
    try {
      emit(InitialSelectImage());
      final ImagePicker picker = ImagePicker();
      final XFile? myImage = await picker.pickImage(
        source: ImageSource.camera,
      );
      if (myImage == null) return;
      File imageFile = File(myImage.path);
      image = imageFile;
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  void makeSignUp(
    String? fullName,
    String? phone,
    String? emailAddress,
    String? password,
  ) {
    emit(RegisterState());
    if (fullName!.isEmpty) {
      errorFullName = "Please enter your full name";
    } else {
      errorFullName = null;
    }

    if (phone!.isEmpty) {
      errorPhoneValidator = "Please enter phone number";
    } else {
      String phonePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
      RegExp phoneRegExp = RegExp(phonePattern);
      if (!phoneRegExp.hasMatch(phone!)) {
        errorPhoneValidator = 'Please enter valid mobile number';
      } else {
        errorPhoneValidator = null;
      }
    }

    if (emailAddress!.isEmpty) {
      errorEmailAddress = "Please enter email address";
    } else {
      String emailPattern =
          "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$";
      RegExp emailRegExp = RegExp(emailPattern);
      if (!emailRegExp.hasMatch(emailAddress!)) {
        errorEmailAddress = 'this email is not valid';
      } else {
        errorEmailAddress = null;
      }
    }

    if (password!.isEmpty) {
      errorPasswordValidator = "Please enter email address";
    } else {
      if (password!.length < 8) {
        errorPasswordValidator = "it must have at least 8 digits";
      } else {
        errorPasswordValidator = null;
      }
    }
    if (errorPhoneValidator == null &&
        errorPasswordValidator == null &&
        errorFullName == null &&
        errorEmailAddress == null) {
      authRepository
          .makeSignUp(
        full_name: fullName,
        phoneNumber: phone,
        email: emailAddress,
        password: password,
      )
          .then((value) {
            if(image == null)
              {
                emit(RegisterSuccessState());
              }
            else{
              if(value!.message == "Creation successful")
                {
                  makeUpload(value!.data![0].id, image);
                  emit(RegisterSuccessState());
                }
            }
      }).catchError((e) {
        emit(RegisterFailedState());
        print("Error SignUp ${e.toString()}");
      });
    } else {}
  }

  void makeUpload(String? id, File? imageFile) {
    authRepository
        .makeUpload(id: id, imageFileProfile: imageFile)
        .then((value) {
          authModel = value;
    })
        .catchError((e) {
    });
  }
}
