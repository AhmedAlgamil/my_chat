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
}
