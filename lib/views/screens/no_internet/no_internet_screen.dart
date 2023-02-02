import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:nt_fifth_exam/state_managments/cubits/connectivity/connectivity_cubit.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key, required this.voidCallback})
      : super(key: key);

  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: LottieBuilder.asset(
                 "assets/lottie/no_internet.json",
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            BlocListener<ConnectivityCubit, ConnectivityState>(
              listener: (context, state) {
                if (state.connectivityResult != ConnectivityResult.none) {
                  
                  Navigator.pop(context);
                }
              },
              child: const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}