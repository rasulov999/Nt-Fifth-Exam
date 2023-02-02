import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nt_fifth_exam/data/models/my_response.dart';
import 'package:nt_fifth_exam/data/repository/satellites_repository.dart';
import 'package:nt_fifth_exam/state_managments/cubits/customer_satellites/customer_statellites_state.dart';

class CustomerSatellitesCubit extends Cubit<CustomerSatellitesState> {
  CustomerSatellitesCubit(this.repository) : super(InitialState()) {
    fetchData();
  }

  final SatellitesRepository repository;

  fetchData() async {
    emit(LoadDataInProgress());
    MyResponse myResponse = await repository.getData();
    if (myResponse.error.isEmpty) {
      emit(LoadDataInSucces(model: myResponse.data));
      debugPrint(myResponse.data);
    } else {
      emit(LoadDataInFailure(errorText: myResponse.error));
    }
  }
}
