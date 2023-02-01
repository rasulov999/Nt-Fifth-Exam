import 'package:flutter_bloc/flutter_bloc.dart';

class TabCubit extends Cubit<int> {
  TabCubit() : super(0);
  int activeIndex = 0;

  void newPageIndex(int newIndex) {
    emit(activeIndex=newIndex);
  }
}
