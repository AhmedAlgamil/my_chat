import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat/modules/auth/presentation/screens/login_screen.dart';

import '../../../../shared/local/shared_prefrence.dart';
import '../store/home_page_cubit.dart';
import '../store/home_page_states.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({Key? key}) : super(key: key);

  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    ThemeData thData = Theme.of(context);
    return BlocProvider(
      create: (context) {
        return HomePageCubit();
      },
      child: BlocConsumer<HomePageCubit, HomePageStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomePageCubit cubit = HomePageCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("My Chat"),
              backgroundColor: thData.accentColor,
              actions: [
                IconButton(
                    onPressed: () {

                    },
                    icon: const Icon(Icons.search),
                    splashRadius: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                      onPressed: () {
                        MyChatSharedPrefrence.setBool("isLogedIn", false);
                        MyChatSharedPrefrence.setString("myId", null);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                            (route) => false);
                      },
                      icon: const Icon(Icons.menu),
                      splashRadius: 20),
                ),
              ],
            ),
            backgroundColor: thData.backgroundColor,
            body: Container(),
          );
        },
      ),
    );
  }
}
