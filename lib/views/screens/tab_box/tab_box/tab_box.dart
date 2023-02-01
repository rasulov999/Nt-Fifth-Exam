import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nt_fifth_exam/state_managments/cubit/tab_cubit/tab_cubit.dart';
import 'package:nt_fifth_exam/views/screens/tab_box/a_screen/a_screen.dart';
import 'package:nt_fifth_exam/views/screens/tab_box/b_screen/b_screen.dart';
import 'package:nt_fifth_exam/views/screens/tab_box/c_screen/c_screen.dart';
import 'package:nt_fifth_exam/views/screens/tab_box/d_screen/d_screen.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> screens = [];
  @override
  void initState() {
    screens = [
      AScreen(),
     BScreen(),
     CScreen(),
     DScreen()    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabCubit, int>(builder: (context, state) {
      var index = context.read<TabCubit>().activeIndex;
      return Scaffold(
        body: screens[index],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.blueGrey,
          selectedItemColor: Colors.black,
          currentIndex: index,
          onTap: (value) {
            BlocProvider.of<TabCubit>(context).newPageIndex(value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward),
              label: "A",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.compare_arrows_sharp),
              label: "B",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.compare_arrows_sharp),
              label: "C",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back),
              label: "D",
            ),
          ],
        ),
      );
    });
  }
}
