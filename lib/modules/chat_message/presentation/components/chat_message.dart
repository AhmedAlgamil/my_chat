import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_chat/modules/chat_message/presentation/components/reply_message_component.dart';

class ChatMessageComponent extends StatelessWidget {
  ChatMessageComponent(
      {Key? key, this.myMessage, this.isSender = false, this.myTime,this.makeReplyFunction, this.make,this.callback})
      : super(key: key);

  String? myMessage, myTime,userName,repliedMessage;
  final Function()? makeReplyFunction;
  final Function(String val)? make;
  final Function? callback;
  bool isSender;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: isSender ? TextDirection.ltr : TextDirection.rtl,
      crossAxisAlignment:
      isSender ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Container(
          key: key,
          width: MediaQuery.of(context).size.width * 0.8,
          margin: const EdgeInsets.all(5),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Ink(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTapDown: (details) {
                      showMenu<String>(
                        context: context,
                        position: RelativeRect.fromLTRB(
                          details.globalPosition.dx,
                          details.globalPosition.dy,
                          details.globalPosition.dx,
                          details.globalPosition.dy,
                        ),
                        color: Theme.of(context).accentColor,
                        //position where you want to show the menu on screen
                        items: [
                          PopupMenuItem<String>(
                              value: '1',
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Send'),
                                  Icon(Icons.send)
                                ],
                              )),
                          PopupMenuItem<String>(
                              value: '2',
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Copy'),
                                  Icon(Icons.copy)
                                ],
                              )),
                          PopupMenuItem<String>(
                              value: '3',
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Reply'),
                                  Icon(Icons.replay)
                                ],
                              )),
                          PopupMenuItem<String>(
                              value: '4',
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Add to favourite'),
                                  Icon(Icons.star_border)
                                ],
                              )),
                        ],
                        elevation: 8.0,
                      ).then<void>((String? itemSelected) {
                        if (itemSelected == null) return;

                        if (itemSelected == "1") {
                          //code here
                        } else if (itemSelected == "2") {
                          //code here
                          Clipboard.setData(ClipboardData(text: myMessage)).then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Text Copied")));
                          });
                        } else if (itemSelected == "3") {
                          //code here
                        } else if (itemSelected == "4") {
                          //code here

                        } else {
                          //code here
                        }
                      });
                    },
                    child: const Icon(Icons.menu),
                  ),
                ),
                ReplyMessageComponent(userName: "userName",message: "Message",),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RichText(
                    maxLines: 20,
                    text: TextSpan(
                        text: myMessage!,
                        style: const TextStyle(
                          fontSize: 15,
                        )),
                    softWrap: true,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.bottomRight,
                  child: RichText(
                    maxLines: 20,
                    text: const TextSpan(
                        text: "12:54",
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
