import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../store/home_page_cubit.dart';
import '../store/home_page_states.dart';
class ImageScreen extends StatelessWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    ThemeData thData = Theme.of(context);
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
              ],
            ),
            backgroundColor: thData.colorScheme.background,
            body: Stack(
              children: [
                Container(
                  height: mq.size.height,
                  color: Color(0x37343434),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25),
                  child: Card(
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
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
                            icon: const Icon(
                                Icons.message),
                          ),
                          trailing: Text("Ahmed"),
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
