import 'package:my_chat/modules/auth/data/models/auth_model.dart';
import 'package:my_chat/modules/auth/data/remote_data_sources/auth_remote_data_source.dart';

import '../models/Chaters.dart';
import '../remote_data_sources/home_page_remote_data_source.dart';

class HomePageRepository{
  final HomePageDataSource homePageRemoteDataSource = new HomePageDataSource();

  Future<Chaters?> getAllChaters({
    required String? phoneNumber,
  }) async {
    try {
      return await homePageRemoteDataSource.getAllChaters(phoneNumber: phoneNumber);
    } catch (error) {
      rethrow;
    }
  }

}