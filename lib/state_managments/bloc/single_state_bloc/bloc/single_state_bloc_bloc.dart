import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'single_state_bloc_event.dart';
part 'single_state_bloc_state.dart';

class SingleStateBlocBloc extends Bloc<SingleStateBlocEvent, SingleStateBlocState> {
  SingleStateBlocBloc() : super() {
    on<SingleStateBlocEvent>((event, emit) {
    
    });
  }
}
