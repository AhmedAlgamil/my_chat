import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat/modules/auth/data/models/auth_model.dart';
import 'package:my_chat/modules/auth/data/repository/auth_repository.dart';

import 'chat_message_states.dart';

class ChatMessageCubit extends Cubit<ChatMessageStates> {
  ChatMessageCubit() : super(IntialChatMessageState());

  static ChatMessageCubit get(BuildContext context) => BlocProvider.of(context);

  bool passwordIsShowen = true;
  String? errorMessage = "";
  AuthRepository authRepository = AuthRepository();

  AuthModel? authModel;

  List<GlobalKey>? keies = null;

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

  void addGlobalKeies() {
    for (int i = 0; i < 5; i++) {
      keies!.add(GlobalKey());
      emit(IntialChatMessageState());
    }
  }
}
