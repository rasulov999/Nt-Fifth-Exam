import 'package:flutter/material.dart';
import 'package:nt_fifth_exam/data/sql/storage/storage.dart';
import 'package:nt_fifth_exam/views/screens/tab_box/tab_box/tab_box.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Screen"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await StorageRepository.deleteBool("isLogged");
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => TabBox()));
              },
              child: const Text("Reset Password"),
            ),
          ),
        ],
      ),
    );
  }
}
