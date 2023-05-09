import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat/modules/auth/data/models/auth_model.dart';
import 'package:my_chat/modules/home_page/data/repository/home_page_repository.dart';
import 'package:my_chat/modules/home_page/presentation/store/home_page_states.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../generated/l10n.dart';
import '../../../../main.dart';
import '../../data/models/Chaters.dart';

class HomePageCubit extends Cubit<HomePageStates> {
  HomePageCubit() : super(IntialHomePageState());

  static HomePageCubit get(BuildContext context) => BlocProvider.of(context);

  bool passwordIsShowen = true;
  String? errorMessage = "";

  HomePageRepository? homePageRepository = HomePageRepository();

  List<Contact>? contacts;
  List<Chaters>? chaters = [];
  String imageUrl = "assets/images/blank_profile.jpg";

  AuthModel? authModel;

  Future<void> getAllChaters() async {
    emit(GetAllContactsState());
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      // contacts = await ContactsService.getContacts();
      List<String> phones = ["01092788160","01098283826","01099978728","01277823947","01025626183"];

      for(int i = 0;i < phones!.length;i++)
        {
          homePageRepository?.getAllChaters(phoneNumber: phones[i]).then((value) {
            if(value!.data![0] == null){

            }
            else{
              chaters!.add(value!);
              print(value!.data![0].fullName);
              emit(GettingSucceful());
            }

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
