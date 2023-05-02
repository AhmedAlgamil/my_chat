import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat/modules/auth/data/models/auth_model.dart';
import 'package:my_chat/modules/auth/data/repository/auth_repository.dart';
import 'package:my_chat/modules/home_page/data/repository/home_page_repository.dart';
import 'package:my_chat/modules/home_page/presentation/store/home_page_states.dart';
import 'package:my_chat/shared/network/dio_helper.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../data/models/Chaters.dart';

class HomePageCubit extends Cubit<HomePageStates> {
  HomePageCubit() : super(IntialHomePageState());

  static HomePageCubit get(BuildContext context) => BlocProvider.of(context);

  bool passwordIsShowen = true;
  String? errorMessage = "";

  HomePageRepository? homePageRepository = HomePageRepository();

  List<Contact>? contacts;
  List<Chaters>? chaters = [];

  AuthModel? authModel;

  Future<void> getAllChaters() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      contacts = await FastContacts.getAllContacts();
      for(int i = 0 ; i < contacts!.length;i++)
      {
        homePageRepository?.getAllChaters(phoneNumber: contacts![i].phones[0].number).then((value) {
          // chaters!.add(value!);
          print(value!.data![0].fullName);
        }).catchError((e){
          print(e);
        });
      }

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
