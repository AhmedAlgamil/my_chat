import 'package:flutter/material.dart';
class ReplyMessageComponent extends StatelessWidget {
  ReplyMessageComponent({Key? key,required this.userName,required this.message}) : super(key: key);

  String? userName;
  String? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30,right: 20,left: 20),
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
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(userName!),
                    SizedBox(
                      height: 5,
                    ),
                    Text(message!),
                  ],
                ),
                Icon(
                  Icons.access_alarm,
                  size: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
