import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat/modules/auth/presentation/screens/login_screen.dart';
import 'package:my_chat/modules/home_page/presentation/screens/image_screen.dart';

import '../../../../generated/l10n.dart';
import '../../../../shared/local/shared_prefrence.dart';
import '../../../auth/presentation/components/custom_text_form_field.dart';
import '../../../chat_message/presentation/screens/chat_message_screen.dart';
import '../store/home_page_cubit.dart';
import '../store/home_page_states.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();
  int currentIndex = 0;
  FadeInImage myFadeImage = FadeInImage(
    placeholder: const AssetImage("assets/images/test.png"),
    image: NetworkImage(
      MyChatSharedPrefrence.get("myImage"),
    ),
  );
  List<BottomNavigationBarItem> bottomNavs = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    const BottomNavigationBarItem(icon: Icon(Icons.group), label: "Group"),
    const BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
  ];

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
            // bottomNavigationBar: BottomNavigationBar(
            //   currentIndex: currentIndex,
            //   iconSize: (mq.size.width) * 0.1,
            //   onTap: (val) {},
            //   items: bottomNavs,
            // ),
            appBar: AppBar(
              title: Text(S.of(context).myChat),
              backgroundColor: thData.accentColor,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green),
                    width: mq.size.width * 0.15,
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "5",
                          ),
                          Icon(
                            Icons.person,
                            color: thData.accentColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    MyChatSharedPrefrence.setBool("isLogedIn", false);
                    MyChatSharedPrefrence.remove("myId");
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => LoginScreen(),
                    //     ),
                    //     (route) => false);
                    print("my image ${MyChatSharedPrefrence.get("myImage")}");
                  },
                  child: CircleAvatar(
                    backgroundImage:
                        MyChatSharedPrefrence.get("myImage") == null
                            ? myFadeImage.placeholder
                            : myFadeImage.image,
                  ),
                  // child: CircleAvatar(
                  //   backgroundImage: FadeInImage.assetNetwork(
                  //     placeholder: "assets/images/test.png",
                  //     image: MyChatSharedPrefrence.get("myImage"),
                  //   ).image,
                  // ),
                  // child: MyChatSharedPrefrence.get("myImage") == "" ? CircleAvatar(
                  //   backgroundImage: AssetImage(
                  //     cubit.imageUrl,
                  //   ),
                  //   backgroundColor:
                  //   thData.colorScheme.onSecondary,
                  // ):CircleAvatar(
                  //   backgroundImage: NetworkImage(
                  //     MyChatSharedPrefrence.get("myImage"),
                  //   ),
                  //   backgroundColor:
                  //   thData.colorScheme.onSecondary,
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FloatingActionButton(
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
                    child: Icon(Icons.search, color: thData.accentColor),
                    mini: true,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            backgroundColor: thData.colorScheme.background,
            body: Stack(
              children: [
                if (false)
                  Container(
                    height: mq.size.height,
                    color: const Color(0x84343434),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image(
                              image: AssetImage(
                                cubit.imageUrl,
                              ),
                            ),
                          ),
                          ListTile(
                            leading: IconButton(
                              onPressed: () {},
                              splashRadius: 20,
                              icon: const Icon(Icons.message),
                            ),
                            trailing: const Text("Ahmed"),
                            title: Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                onPressed: () {},
                                splashRadius: 20,
                                icon: const Icon(Icons.info),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Column(
                  children: [
                    // note 1: to add listview.builder inside column you must use expanded
                    Expanded(
                      child: ListView.builder(
                        // itemCount: cubit.contacts == null ? 0 : cubit.contacts!.length,
                        itemCount: cubit.chaters!.length,
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
                                        chaterName: cubit
                                            .chaters![index].data![0].fullName,
                                        profileName: cubit
                                            .chaters![index].data![0].imageUrl!,
                                      ),
                                    ),
                                  );
                                },
                                leading: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          backgroundColor: Colors.transparent,
                                          child: Container(
                                            width: mq.size.width * 0.45,
                                            height: mq.size.height * 0.4,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: thData.accentColor,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                    10.0,
                                                  ),
                                                  child: Image(
                                                    image: AssetImage(
                                                      cubit.imageUrl,
                                                    ),
                                                  ),
                                                ),
                                                ListTile(
                                                  leading: IconButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              // ChatMessageScreen(chaterName: cubit.chaters![index].data![0].fullName!,),
                                                              ChatMessageScreen(
                                                            chaterName:
                                                                titles[index],
                                                            profileName:
                                                                cubit.imageUrl,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    splashRadius: 20,
                                                    icon: const Icon(
                                                        Icons.message),
                                                  ),
                                                  trailing: const Text("Ahmed"),
                                                  title: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: IconButton(
                                                      onPressed: () {},
                                                      splashRadius: 20,
                                                      icon: const Icon(
                                                          Icons.info),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                    // Navigator.push(context,  MaterialPageRoute(
                                    //     fullscreenDialog: true,
                                    //     builder: (BuildContext context) {
                                    //       return  Scaffold(
                                    //         appBar:  AppBar(
                                    //           title:  const Text('Dialog'),
                                    //         ),
                                    //         body: const Hero(
                                    //           tag: "preview",
                                    //           child:  Image(
                                    //             image:  AssetImage('assets/images/test.png'),
                                    //           ),
                                    //         ),
                                    //       );
                                    //     }
                                    // ));
                                  },
                                  child: Hero(
                                    tag: "preview",
                                    child: cubit.chaters![index].data![0]
                                                .imageUrl! ==
                                            null
                                        ? CircleAvatar(
                                            backgroundImage:
                                                FadeInImage.assetNetwork(
                                                        placeholder: "",
                                                        image: "")
                                                    .image,
                                            backgroundColor:
                                                thData.colorScheme.onSecondary,
                                            child: Icon(
                                              Icons.person,
                                              color:
                                                  thData.colorScheme.background,
                                            ),
                                          )
                                        : CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              cubit.chaters![index].data![0]
                                                  .imageUrl!,
                                            ),
                                            backgroundColor:
                                                thData.colorScheme.onSecondary,
                                            child: Icon(
                                              Icons.person,
                                              color:
                                                  thData.colorScheme.background,
                                            ),
                                          ),
                                  ),
                                ),
                                title: Text(
                                  titles[index],
                                  // cubit.chaters![index].data![0].fullName!,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                subtitle: Text(
                                  // cubit.chaters![index].data![0].phoneNumber!,
                                  titles[index],
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                              const Divider(
                                height: 0,
                              ), //                           <-- Divider
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
