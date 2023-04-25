

import 'dart:io';

import 'package:my_chat/modules/auth/data/models/auth_model.dart';
import 'package:my_chat/modules/auth/data/remote_data_sources/auth_remote_data_source.dart';

class AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource = new AuthRemoteDataSource();

  Future<AuthModel?> login({
    required String? phoneNumber,
    required String? password,
  }) async {
    try {
      return await authRemoteDataSource.login(
          phoneNumber: phoneNumber, password: password);
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
    try {
      return await authRemoteDataSource.makeSignUp(
        full_name: full_name,
        phoneNumber: phoneNumber,
        email: email,
        password: password
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<AuthModel?> makeUpload({
    required String? id,
    required File? imageFileProfile,
  }) async {
    try {
      return await authRemoteDataSource.makeUploadProfileImage(
          id: id,
          imageFile: imageFileProfile,
      );
    } catch (error) {
      rethrow;
    }
  }
}
