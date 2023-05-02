import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat/modules/chat_message/data/models/message.dart';

import '../components/chat_message.dart';
import '../components/reply_message_component.dart';
import '../store/chat_message_cubit.dart';
import '../store/chat_message_states.dart';

class ChatMessageScreen extends StatelessWidget {
  ChatMessageScreen({
    Key? key,
    this.chaterName,
  }) : super(key: key);

  String? chaterName;

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void makeReply() {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Replied")));
    }

    MediaQueryData mq = MediaQuery.of(context);
    ThemeData thData = Theme.of(context);

    return BlocProvider(
      create: (context) {
        return ChatMessageCubit();
      },
      child: BlocConsumer<ChatMessageCubit, ChatMessageStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ChatMessageCubit cubit = ChatMessageCubit.get(context);
          ScrollController _controller = new ScrollController();

          return Scaffold(
            floatingActionButton: false
                ? Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60.0, left: 30),
                child: FloatingActionButton(
                    heroTag: 'down',
                    onPressed: () {},
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.arrow_downward_rounded),
                    mini: true),
              ),
            )
                : Container(),
            appBar: AppBar(
              title: Ink(
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          child: Icon(
                            Icons.person,
                            color: thData.accentColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: mq.size.width * 0.02,
                      ),
                      Text(
                        chaterName!,
                        style: thData.textTheme.headline4,
                      ),
                    ],
                  ),
                ),
              ),
              backgroundColor: thData.accentColor,
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                    splashRadius: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                    splashRadius: 20,
                  ),
                ),
              ],
            ),
            backgroundColor: thData.backgroundColor,
            body: SizedBox(
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: cubit.messages == null
                              ? 0
                              : cubit.messages!.length,
                          reverse: false,
                          itemBuilder: (context, index) {
                            return Container(
                              child: ChatMessageComponent(
                                myMessage: cubit.messages![index].message,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  if (false)
                    ReplyMessageComponent(
                      userName: "userName",
                      message: "Message",
                    ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Container(
                            decoration: BoxDecoration(
                                color: thData.accentColor,
                                borderRadius: BorderRadius.circular(40)),
                            child: TextField(
                              controller: messageController,
                              style: thData.textTheme.headline4,
                              minLines: 1,
                              maxLines: 3,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: thData.accentColor,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: thData.accentColor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: thData.accentColor,
                                  ),
                                ),
                                prefixIcon: IconButton(
                                  icon: Icon(Icons.emoji_emotions_outlined),
                                  onPressed: () {},
                                  color: thData.primaryColorLight,
                                  splashRadius: 20,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.attach_file),
                                  onPressed: () {},
                                  color: thData.primaryColorLight,
                                  splashRadius: 20,
                                ),
                                hintText: "Message",
                                hintStyle: thData.textTheme.headline3,
                              ),
                              onChanged: (value){
                                cubit.onTextChanged(value);
                              },
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: FloatingActionButton(
                              heroTag: 'record',
                              onPressed: () {
                                if(cubit.isRecordButton){

                                }
                                else{
                                  Message message = Message(id: "1",currentTime: DateTime.now().toString(),message: messageController.text,senderId: "2");
                                  cubit.addMessage(message);
                                  cubit.isRecordButton = true;
                                  messageController.clear();
                                }
                              },
                              mini: true,
                              backgroundColor: thData.primaryColorLight,
                              child:
                              cubit.isRecordButton ? Icon(Icons.mic, color: thData.primaryColor) : Icon(Icons.send, color: thData.primaryColor),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
