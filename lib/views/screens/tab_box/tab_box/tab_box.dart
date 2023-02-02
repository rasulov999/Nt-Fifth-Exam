import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nt_fifth_exam/data/sql/storage/storage.dart';
import 'package:nt_fifth_exam/state_managments/cubits/connectivity/connectivity_cubit.dart';
import 'package:nt_fifth_exam/state_managments/cubits/tab_cubit/tab_cubit.dart';
import 'package:nt_fifth_exam/views/screens/new_screen/new_screen.dart';
import 'package:nt_fifth_exam/views/screens/no_internet/no_internet_screen.dart';
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
  bool isLogged = false;

  int index = 0;
  @override
  void initState() {
    screens = [
      AScreen(),
      BScreen(),
      CScreen(),
      DScreen(),
    ];
    super.initState();
  }

  _init() async {
    print("INTERNET TURNED ON CALL ANY API");
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityCubit, ConnectivityState>(
      listener: (context, state) {
        if (state.connectivityResult == ConnectivityResult.none) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NoInternetScreen(
                  voidCallback: _init,
                ),
              ));
        }
      },
      child: Scaffold(
        body: screens[index],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.blueGrey,
          selectedItemColor: Colors.black,
          onTap: (int value) {
            setState(() {
              index = value;
            });
          },
          currentIndex: index,
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
      ),
    );
  }
}
