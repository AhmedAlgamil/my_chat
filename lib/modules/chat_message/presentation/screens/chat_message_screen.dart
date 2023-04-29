import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/chat_message.dart';
import '../store/chat_message_cubit.dart';
import '../store/chat_message_states.dart';

class ChatMessageScreen extends StatelessWidget {
  ChatMessageScreen({
    Key? key,
    this.chaterName,
  }) : super(key: key);

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? chaterName;

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
                      Text(chaterName!,style: thData.textTheme.headline4,),
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
              height: mq.size.height,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: SizedBox(
                      height: mq.size.height * 0.8,
                      child: ListView.builder(
                        itemCount: 3,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return Container(
                            // color:  Color(0xff1b8daa),
                            child: ChatMessageComponent(
                                myMessage:
                                    "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was"
                                    " born and I will give you a complete account of the system, and expound the actual teachings of the "
                                    "great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or"
                                    " avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue "
                                    "pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who "
                                    "loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally "
                                    "circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example,"
                                    " which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any "
                                    "right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences,"
                                    " or one who avoids a pain that produces no resultant pleasure?"),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.1,
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                stops: [0.02, 0.02],
                                colors: [
                                  Colors.red,
                                  Colors.white,
                                ],
                              ),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("userName"),
                                        SizedBox(height: 5,),
                                        Text("repliedMessage"),
                                      ],
                                    ),
                                    Icon(Icons.access_alarm,size: 50,),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                width: mq.size.width * 1,
                                decoration: BoxDecoration(
                                    color: thData.accentColor,
                                    borderRadius: BorderRadius.circular(50)),
                                child: TextField(
                                  style: thData.textTheme.headline4,
                                  minLines: 1,
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: thData.accentColor,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: thData.accentColor,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
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
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: FloatingActionButton(
                                  onPressed: () {},
                                  backgroundColor: thData.primaryColorLight,
                                  child:
                                      Icon(Icons.mic, color: thData.primaryColor),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 60.0, left: 10),
                      child: FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.arrow_downward_rounded),
                          mini: true),
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
