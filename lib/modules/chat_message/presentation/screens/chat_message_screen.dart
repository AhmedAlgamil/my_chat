import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:uuid/uuid.dart';
import '../store/chat_message_cubit.dart';
import '../store/chat_message_states.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatMessageScreen extends StatelessWidget {
  ChatMessageScreen({
    Key? key,
    this.chaterName,
  }) : super(key: key);

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? chaterName;
  List<types.Message> _messages = [];
  final _user = const types.User(
    id: '2',
  );

  @override
  Widget build(BuildContext context) {
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
                      Text(chaterName!),
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
            body: Container(
              color: Colors.blue,
              width: mq.size.width,
              child: Column(
                children: [

                  Text(
                    'This is a responsive text... as you can see it\'s size is '
                        'adjusting on different devices',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'This is a responsive text... as you can see it\'s size is '
                        'adjusting on different devices',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'This is a responsive text... as you can see it\'s size is '
                        'adjusting on different devices',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'This is a responsive text... as you can see it\'s size is '
                        'adjusting on different devices',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: 380,
                    alignment: Alignment.centerLeft,
                    child: Card(
                      child: Text(
                          overflow: TextOverflow.ellipsis,
                          "ذهب الولد الى الدرس"),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Card(
                      child: Text(
                          "ذهب الولد الى الدرس"),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    width: mq.size.width * 0.8,
                    child: Card(
                      child: Expanded(
                        child: Text(
                          textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: true),
                          softWrap: true,
                            overflow: TextOverflow.clip,
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
                      ),
                    ),
                  ),
                  Container(
                    width: 380,
                    alignment: Alignment.centerLeft,
                    child: Card(
                      child: Text(
                          "ذهب الولد الى الدرس"),
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
