import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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
  int index = 0;

  String? repliedMessage, userName;

  List<GlobalKey>? keies = null;

  List<Message>? messages = [];
  File? image, photo;
  bool isEmojiOn = false;
  bool isWillReply = false;
  bool isPanelShowen = false;

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

  void setReplyMessage(String? replyMessage, String? userName) {
    emit(onRepliedSet());
    this.repliedMessage = replyMessage;
    this.userName = userName;
  }

  void showEmoji(bool isEmojiOn) {
    emit(onEmojiShowed());
    this.isEmojiOn = isEmojiOn;
  }

  void showDocumentsPanel(bool isPanelShowen) {
    emit(onPanelShowen());
    this.isPanelShowen = isPanelShowen;
  }

  void showIsReply(bool isWillReply) {
    emit(onReplyShowed());
    this.isWillReply = isWillReply;
  }

  Future pickMultiImage() async {
    try {
      emit(InitialUploadChatImage());
      final ImagePicker picker = ImagePicker();
      final List<XFile> myImages = await picker.pickMultiImage();
      if (myImages == null) return;
      for (int i = 0; i < myImages.length; i++) {
        File imageFile = File(myImages[i].path);
        image = imageFile;
        //makeUpload();
      }
      emit(ImageSelectedState());
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  Future takePhoto() async {
    try {
      emit(InitialUploadChatImage());
      final ImagePicker picker = ImagePicker();
      final XFile? myImage = await picker.pickImage(source: ImageSource.camera);
      if (myImage == null) return;
      File imageFile = File(myImage.path);
      image = imageFile;
      emit(ImageSelectedState());
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  void onTextChanged(String myValue) {
    if (myValue.isEmpty) {
      this.isRecordButton = true;
    } else {
      this.isRecordButton = false;
    }
    emit(OnTextChanged());
  }

  void addMessage(Message? message) {
    messages!.add(message!);
    // messages![index] = message!;
    emit(AddMessage());
  }

  void addGlobalKeies() {
    for (int i = 0; i < 5; i++) {
      keies!.add(GlobalKey());
      emit(IntialChatMessageState());
    }
  }
}
