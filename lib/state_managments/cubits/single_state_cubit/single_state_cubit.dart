import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nt_fifth_exam/data/api/api_service.dart';
import 'package:nt_fifth_exam/data/models/my_response.dart';
import 'package:nt_fifth_exam/data/repository/satellites_repository.dart';
import 'package:nt_fifth_exam/state_managments/cubits/single_state_cubit/single_state_state.dart';

class SingleStateCubit extends Cubit<SingleState> {
  SingleStateCubit(this.repository)
      : super(const SingleState(
            statusText: StatusText.pure, errorText: "", model: [])) {
    fetchData();
  }
  final SatellitesRepository repository;
 

  fetchData() async {
    emit(state.copyWtih(statusText: StatusText.loading));
    MyResponse myResponse = await repository.getData();
    if (myResponse.error.isEmpty) {
      emit(state.copyWtih(
          model: myResponse.data, statusText: StatusText.succes));
    } else {
      emit(state.copyWtih(
          errorText: myResponse.error, statusText: StatusText.error));
    }
  }
}
