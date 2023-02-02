import 'package:flutter/material.dart';
import 'package:flutter_pin_code_widget/flutter_pin_code_widget.dart';
import 'package:nt_fifth_exam/data/sql/storage/storage.dart';
import 'package:nt_fifth_exam/views/screens/new_screen/new_screen.dart';
import 'package:nt_fifth_exam/views/screens/tab_box/tab_box/tab_box.dart';

class CScreen extends StatefulWidget {
  const CScreen({super.key});

  @override
  State<CScreen> createState() => _CScreenState();
}

class _CScreenState extends State<CScreen> {
  newState() async {}

  @override
  void initState() {
    newState();
    super.initState();
  }

  String pass = "";
  var isLogged = StorageRepository.getBool("isLogged");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("C Screen"),
        centerTitle: true,
      ),
      body: isLogged
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      await StorageRepository.deleteBool("isLogged");
                      setState(() {
                        isLogged=!isLogged;
                      });
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => TabBox()));
                    },
                    child: const Text("Reset Password"),
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Text(
                  'Set up PIN',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 20),
                const Text('You can use this PIN to unlock the app.'),
                const SizedBox(height: 60),
                Expanded(
                  child: PinCodeWidget(
                    onPressColorAnimation: Colors.transparent,
                    emptyIndicatorColor: Colors.grey,
                    deleteButtonColor: Colors.grey,
                    buttonColor: Colors.blue,
                    numbersStyle:
                        const TextStyle(color: Colors.white, fontSize: 20),
                    onFullPin: (_, __) async {
                      await StorageRepository.getInstance();
                      await StorageRepository.putBool("isLogged", true);

                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => NewScreen()));
                    },
                    initialPinLength: 4,
                    onChangedPin: (val) async {
                      await StorageRepository.putString(
                          key: "password", value: val);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
