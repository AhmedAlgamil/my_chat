import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat/modules/auth/data/models/auth_model.dart';
import 'package:my_chat/modules/auth/data/repository/auth_repository.dart';

import '../../data/models/message.dart';
import 'chat_message_states.dart';

class ChatMessageCubit extends Cubit<ChatMessageStates> {
  ChatMessageCubit() : super(IntialChatMessageState());

  static ChatMessageCubit get(BuildContext context) => BlocProvider.of(context);

  bool passwordIsShowen = true;
  String? errorMessage = "";
  AuthRepository authRepository = AuthRepository();

  bool isRecordButton = true;

  AuthModel? authModel;
  int index=0;

  List<GlobalKey>? keies = null;

  List<Message>? messages = [];

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

  void onTextChanged(String myValue){
    if(myValue.isEmpty)
    {
      this.isRecordButton = true;
    }
    else{
      this.isRecordButton = false;
    }
    emit(OnTextChanged());
  }

  void addMessage(Message? message){
    messages!.add(message!);
    // messages![index] = message!;
    index++;
    print(message!.message);
    print(message!.currentTime);
    print(message!.id);
    print(message!.senderId);
    emit(AddMessage());
  }

  void addGlobalKeies() {
    for (int i = 0; i < 5; i++) {
      keies!.add(GlobalKey());
      emit(IntialChatMessageState());
    }
  }
}
