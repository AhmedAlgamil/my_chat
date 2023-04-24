import 'package:my_chat/modules/auth/data/models/auth_model.dart';
import 'package:my_chat/modules/auth/data/remote_data_sources/auth_remote_data_source.dart';

class AuthRepository{
  final AuthRemoteDataSource authRemoteDataSource = new AuthRemoteDataSource();

  Future<AuthModel?> login({
    required String? phoneNumber,
    required String? password,
  }) async {
    try {
      return await authRemoteDataSource.login(phoneNumber: phoneNumber, password: password);
    } catch (error) {
      rethrow;
    }
  }

}