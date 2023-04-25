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
  }) async {
    FormData? formData = FormData.fromMap({
      "full_name": full_name,
      "phone_number": phoneNumber,
      "email": email,
      "password": password,
      "is_active": "1",
    });
    try {
      final res = await DioHelper.makePostData(
          url: "user_table/table_insert.php", data: formData!);
      return AuthModel.fromJson(res.data);
    } catch (error) {
      rethrow;
    }
  }

  Future<AuthModel?> makeUploadProfileImage({
    required String? id,
    required File? imageFile,
  }) async {
    String fileName = imageFile!.path.split('/').last;
    FormData? formData = FormData.fromMap({
      "id": id,
      "fileToUpload": await MultipartFile.fromFile(imageFile.path, filename:fileName),
    });
    try {
      final res = await DioHelper.makePostData(
          url: "user_table/upload.php", data: formData!);
      return AuthModel.fromJson(res.data);
    } catch (error) {
      rethrow;
    }
  }
}
