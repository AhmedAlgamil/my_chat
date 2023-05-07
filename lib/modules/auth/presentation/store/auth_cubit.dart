import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_chat/modules/auth/data/models/auth_model.dart';
import 'package:my_chat/modules/auth/data/repository/auth_repository.dart';
import 'package:my_chat/modules/auth/presentation/store/auth_states.dart';

import '../../../../generated/l10n.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(IntialAuthState());

  static BuildContext? myContext;

  static AuthCubit get(BuildContext context) {
    myContext = context;
    return BlocProvider.of(context);
  }

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
    if (phone!.isEmpty) {
      errorPhoneValidator = S.of(myContext!).enterPhone;
    } else {
      // Saved Pattern
      // String phonePattern = r"\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|4[987654310]|3[9643210]|2[70]|7|1)\d{1,14}$";
      String phonePattern = r"(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|4[987654310]|3[9643210]|2[70]|7|1)\d{1,14}$";
      RegExp phoneRegExp = RegExp(phonePattern);
      if (!phoneRegExp.hasMatch(phone!)) {
        errorPhoneValidator = S.of(myContext!).phoneValidation;
      } else {
        errorPhoneValidator = null;
      }
    }
    if (password!.isEmpty) {
      errorPasswordValidator = S.of(myContext!).enterPassword;
    } else {
      if (password!.length < 8) {
        errorPasswordValidator = S.of(myContext!).passwordValidation;
      } else {
        errorPasswordValidator = null;
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
          authModel = value;
          emit(LoginLoadedSuccessState());
        },
      ).catchError((e) {
        emit(LoginFailedState());
        if (e is DioError) {
          if (e.message.contains("SocketException")) {
            // print(e.message);
            emit(LoginFailedState());
            errorMessage = S.of(myContext!).offlineMode;
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
      final XFile? myImage =
          await picker.pickImage(source: ImageSource.camera);
      if (myImage == null) return;
      File imageFile = File(myImage.path);
      image = imageFile;
      emit(ImageSelectedState());
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
      errorFullName = S.of(myContext!).enterFullName;
    } else {
      errorFullName = null;
    }

    if (phone!.isEmpty) {
      errorPhoneValidator = S.of(myContext!).enterPhone;
    } else {
      String phonePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
      RegExp phoneRegExp = RegExp(phonePattern);
      if (!phoneRegExp.hasMatch(phone!)) {
        errorPhoneValidator = S.of(myContext!).phoneValidation;
      } else {
        errorPhoneValidator = null;
      }
    }

    if (emailAddress!.isEmpty) {
      errorEmailAddress = S.of(myContext!).enterEmail;
    } else {
      String emailPattern =
          "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$";
      RegExp emailRegExp = RegExp(emailPattern);
      if (!emailRegExp.hasMatch(emailAddress!)) {
        errorEmailAddress = S.of(myContext!).emailValidation;
      } else {
        errorEmailAddress = null;
      }
    }

    if (password!.isEmpty) {
      errorPasswordValidator = S.of(myContext!).enterPassword;
    } else {
      if (password!.length < 8) {
        errorPasswordValidator = S.of(myContext!).passwordValidation;
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
        if (image == null) {
          emit(RegisterSuccessState());
        } else {
          if (value!.message == "Creation successful") {
            print(value!.data![0].id);
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
      print(value!.message);
    }).catchError((e) {
      print("Error SignUp ${e.toString()}");
    });
  }
}
