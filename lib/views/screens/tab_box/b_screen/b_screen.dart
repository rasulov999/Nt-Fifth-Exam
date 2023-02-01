import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nt_fifth_exam/data/api/api_service.dart';
import 'package:nt_fifth_exam/data/repository/satellites_repository.dart';
import 'package:nt_fifth_exam/state_managments/cubit/customer_satellites/customer_statellites_cubit.dart';
import 'package:nt_fifth_exam/state_managments/cubit/customer_satellites/customer_statellites_state.dart';

class BScreen extends StatelessWidget {
  const BScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerSatellitesCubit(
        SatellitesRepository(
          apiService: ApiService(),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("B Screen"),
          centerTitle: true,
        ),
        body: BlocBuilder<CustomerSatellitesCubit, CustomerSatellitesState>(
            builder: (context, state) {
          if (state is InitialState) {
            return const Center(
              child: Text(
                "Hozircha data yo'q",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            );
          } else if (state is LoadDataInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadDataInSucces) {
            return ListView(
                physics: const BouncingScrollPhysics(),
                children: List.generate(
                    state.model.length,
                    (index) => Card(
                          child: ListTile(
                            title: Text(state.model[index].country),
                            subtitle: Text(state.model[index].launcher),
                            trailing: Text(state.model[index].launchTime),
                          ),
                        )));
          } else if (state is LoadDataInFailure) {
            return Center(
              child: Text(
                state.errorText,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            );
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
