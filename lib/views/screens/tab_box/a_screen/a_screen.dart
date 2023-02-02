import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nt_fifth_exam/state_managments/cubits/single_state_cubit/single_state_cubit.dart';
import 'package:nt_fifth_exam/state_managments/cubits/single_state_cubit/single_state_state.dart';

class AScreen extends StatelessWidget {
  const AScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("A Screen"),
        centerTitle: true,
      ),
      body:
          BlocBuilder<SingleStateCubit, SingleState>(builder: (context, state) {
        if (state.statusText == StatusText.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.statusText == StatusText.succes) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: List.generate(
              state.model.length,
              (index) => Card(
                child: ListTile(
                  title: Text(state.model[index].country),
                  subtitle: Text(state.model[index].launcher),
                  trailing: Text(state.model[index].id),
                ),
              ),
            ),
          );
        } else if (state.errorText == StatusText.error) {
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
        return const SizedBox(
        );
      }),
    );
  }
}
