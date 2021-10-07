import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';
import '../../States/home_screen_state.dart';

class HomeScreenProvider extends StatelessWidget {

  const HomeScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeScreenState>(
      create: (_) {
        return HomeScreenState();
      },
      child: const HomeScreen(),
    );
  }
}

