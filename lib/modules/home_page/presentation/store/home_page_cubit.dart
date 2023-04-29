import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat/modules/auth/data/models/auth_model.dart';
import 'package:my_chat/modules/auth/data/repository/auth_repository.dart';
import 'package:my_chat/modules/home_page/presentation/store/home_page_states.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePageCubit extends Cubit<HomePageStates> {
  HomePageCubit() : super(IntialHomePageState());

  static HomePageCubit get(BuildContext context) => BlocProvider.of(context);

  bool passwordIsShowen = true;
  String? errorMessage = "";
  AuthRepository authRepository = AuthRepository();

  List<Contact>? contacts;

  AuthModel? authModel;

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
  Future<void> askPermissions() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      print("permission granted");
    } else {
      _handleInvalidPermissions(permissionStatus);
    }
  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {}
  }
}
