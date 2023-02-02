import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nt_fifth_exam/data/api/api_service.dart';
import 'package:nt_fifth_exam/data/models/my_response.dart';
import 'package:nt_fifth_exam/state_managments/cubit/single_state_cubit/single_state_state.dart';

class SingleStateCubit extends Cubit<SingleState> {
  SingleStateCubit()
      : super(const SingleState(
            statusText: StatusText.pure, model: [], errorText: ""));
  final myLocator = GetIt.instance;
  void setUpLocators() {
    myLocator.registerLazySingleton(() => ApiService());
  }

  fetchData() async {
    emit(state.copyWtih(statusText: StatusText.loading));
    MyResponse myResponse = await myLocator<ApiService>().getData();
    if (myResponse.error.isEmpty) {
      emit(state.copyWtih(
          model: myResponse.data, statusText: StatusText.succes));
    } else {
      emit(state.copyWtih(
          errorText: myResponse.error, statusText: StatusText.error));
    }
  }
}
