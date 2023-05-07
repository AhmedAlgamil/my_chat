import 'package:flutter/material.dart';

import '../screens/chat_message_screen.dart';

class SearchTextField extends SearchDelegate {

  List<String> titles = [
    "Ahmed Gamil",
    "Gamil Ali",
    "Ali Mostafa",
    "Mostafa Yousef",
    "أحمد جميل",
    "علي مصطفى",
    "يوسف",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          splashRadius: 15,
          onPressed: () {
            if (query.isEmpty)
              close(context, null);
            else
              query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        splashRadius: 15,
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> allSuggestion = titles.where((searching) {
      final res = searching.toLowerCase();
      final input = query.toLowerCase();
      return res.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: allSuggestion.length,
      itemBuilder: (context, index) {
        String title = allSuggestion[index];
        ThemeData thData = Theme.of(context);
        return Column(
          children: <Widget>[
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        // ChatMessageScreen(chaterName: cubit.chaters![index].data![0].fullName!,),
                        ChatMessageScreen(
                      chaterName: title,
                    ),
                  ),
                );
              },
              leading: CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 20,
                  color: thData.accentColor,
                ),
              ),
              title: Text(
                title,
                // cubit.chaters![index].data![0].fullName!,
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                // cubit.chaters![index].data![0].phoneNumber!,
                title,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Divider(
              height: 0,
            ), //                           <-- Divider
          ],
        );
      },
    );
  }
}
