import 'package:dio/dio.dart';
import 'package:my_chat/modules/auth/data/models/auth_model.dart';

import '../../../../shared/network/dio_helper.dart';
import '../models/Chaters.dart';

class HomePageDataSource {
  Future<Chaters?> getAllChaters({
    required String? phoneNumber,
  }) async {
    FormData formData =
        FormData.fromMap({"phone_number": phoneNumber});
    try {
      final res = await DioHelper.makePostData(
          url: "user_table/get_hpone_numbers.php", data: formData);
      return Chaters.fromJson(res.data);
    } catch (error) {
      rethrow;
    }
  }
}
