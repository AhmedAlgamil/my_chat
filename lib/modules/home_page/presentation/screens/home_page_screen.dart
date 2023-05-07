import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat/modules/auth/presentation/screens/login_screen.dart';

import '../../../../generated/l10n.dart';
import '../../../../main.dart';
import '../../../../shared/local/shared_prefrence.dart';
import '../../../chat_message/presentation/screens/chat_message_screen.dart';
import '../store/home_page_cubit.dart';
import '../store/home_page_states.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({Key? key}) : super(key: key);

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    ThemeData thData = Theme.of(context);
    List<String> titles = [
      "Ahmed Gamil",
      "Gamil Ali",
      "Ali Mostafa",
      "Mostafa Yousef",
      "أحمد جميل",
      "علي مصطفى",
      "يوسف",
    ];
    return BlocProvider(
      create: (context) {
        return HomePageCubit()..getAllChaters();
      },
      child: BlocConsumer<HomePageCubit, HomePageStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomePageCubit cubit = HomePageCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).myChat),
              backgroundColor: thData.accentColor,
              actions: [
                IconButton(
                    onPressed: () {
                      // cubit.changeLanguage();
                    },
                    icon: const Icon(Icons.search),
                    splashRadius: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: () {
                      MyChatSharedPrefrence.setBool("isLogedIn", false);
                      MyChatSharedPrefrence.remove("myId");
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                          (route) => false);
                    },
                    icon: const Icon(Icons.menu),
                    splashRadius: 20,
                  ),
                ),
              ],
            ),
            backgroundColor: thData.colorScheme.background,
            body: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    child: Row(
                      children: titles.map(
                        (e) {
                          return Ink(
                            width: mq.size.width * 0.3,
                            height: mq.size.height * 0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(15),
                              child: Column(
                                children: [
                                  SizedBox(height: mq.size.height * 0.01,),
                                  Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                            thData.colorScheme.onSecondary,
                                        child: Icon(
                                          Icons.person,
                                          color:
                                              thData.colorScheme.background,
                                        ),
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.green,
                                        radius: 5,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: mq.size.height * 0.01,
                                  ),
                                  Text(
                                    e,
                                    style: thData.textTheme.headlineSmall,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
                // note 1: to add listview.builder inside column you must use expanded
                Expanded(
                  child: ListView.builder(
                    // itemCount: cubit.contacts == null ? 0 : cubit.contacts!.length,
                    itemCount: titles.length,
                    itemBuilder: (context, index) {
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
                                    chaterName: titles[index],
                                  ),
                                ),
                              );
                            },
                            leading: CircleAvatar(
                              backgroundColor: thData.colorScheme.onSecondary,
                              child: Icon(
                                Icons.person,
                                color: thData.colorScheme.background,
                              ),
                            ),
                            title: Text(
                              titles[index],
                              // cubit.chaters![index].data![0].fullName!,
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Text(
                              // cubit.chaters![index].data![0].phoneNumber!,
                              titles[index],
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Divider(
                            height: 0,
                          ), //                           <-- Divider
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
