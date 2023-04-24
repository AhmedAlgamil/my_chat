import 'dart:io';

import 'package:dio/dio.dart';
import 'package:my_chat/modules/auth/data/models/auth_model.dart';

import '../../../../shared/network/dio_helper.dart';

class AuthRemoteDataSource {
  Future<AuthModel?> login({
    required String? phoneNumber,
    required String? password,
  }) async {
    FormData formData =
        FormData.fromMap({"phone_number": phoneNumber, "password": password});
    try {
      final res = await DioHelper.makePostData(
          url: "user_table/table_Login.php", data: formData);
      return AuthModel.fromJson(res.data);
    } catch (error) {
      rethrow;
    }
  }

  Future<AuthModel?> makeSignUp({
    required String? full_name,
    required String? phoneNumber,
    required String? email,
    required String? password,
    String? is_active,
    required File? fileToUpload,
  }) async {
    String fileName = fileToUpload!.path.split('/').last;
    FormData formData = FormData.fromMap({
      "full_name": full_name,
      "phone_number": phoneNumber,
      "email": email,
      "password": password,
      "is_active": "true",
      "fileToUpload":
          await MultipartFile.fromFile(fileToUpload!.path, filename: fileName),
    });
    try {
      final res = await DioHelper.makePostData(
          url: "user_table/table_insert.php", data: formData);
      return AuthModel.fromJson(res.data);
    } catch (error) {
      rethrow;
    }
  }
}
