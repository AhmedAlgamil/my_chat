import 'package:flutter/material.dart';
class ReplyMessageComponent extends StatelessWidget {
  ReplyMessageComponent({Key? key,required this.userName,required this.message,this.isHaveClose = false,this.onPressedClose}) : super(key: key);

  String? userName;
  String? message;
  bool isHaveClose;
  VoidCallback? onPressedClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30,right: 20,left: 20),
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
          onTap: (){

          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0,bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if(isHaveClose)
                IconButton(
                  splashRadius: 20,
                  onPressed: onPressedClose,
                  icon: const Icon(
                    Icons.close,
                    size: 20,
                  ),
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(userName!),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(message!),
                      ],
                    ),

                    const Icon(
                      Icons.access_alarm,
                      size: 50,
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
