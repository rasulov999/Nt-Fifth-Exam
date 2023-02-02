import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nt_fifth_exam/data/api/api_service.dart';
import 'package:nt_fifth_exam/data/repository/satellites_repository.dart';
import 'package:nt_fifth_exam/data/sql/storage/storage.dart';
import 'package:nt_fifth_exam/state_managments/cubits/connectivity/connectivity_cubit.dart';
import 'package:nt_fifth_exam/state_managments/cubits/single_state_cubit/single_state_cubit.dart';
import 'package:nt_fifth_exam/state_managments/cubits/tab_cubit/tab_cubit.dart';
import 'package:nt_fifth_exam/utils/my_utils.dart';
import 'package:nt_fifth_exam/views/screens/tab_box/tab_box/tab_box.dart';

void main()  {
 

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent, // status bar color
    ),
  );

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => ConnectivityCubit()),
    BlocProvider(create: (context) => TabCubit()),
    BlocProvider(
        create: (context) =>
            SingleStateCubit(SatellitesRepository(apiService: ApiService())))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: TabBox(),
    );
  }
}
