import 'package:flutter/material.dart';
import 'package:nt_fifth_exam/data/sql/storage/storage.dart';
import 'package:nt_fifth_exam/views/screens/new_screen/new_screen.dart';
import 'package:nt_fifth_exam/views/screens/tab_box/c_screen/c_screen.dart';

class OtherScreen extends StatefulWidget {
  const OtherScreen({super.key});

  @override
  State<OtherScreen> createState() => _OtherScreenState();
}

class _OtherScreenState extends State<OtherScreen> {
  checkState() async {
    await StorageRepository.getInstance();

    var isLogged = StorageRepository.getBool("isLogged");
    print("IS LOGGED:$isLogged");
    if (isLogged) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return NewScreen();
      }));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return CScreen();
      }));
    }
  }

  @override
  void initState() {
    checkState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
