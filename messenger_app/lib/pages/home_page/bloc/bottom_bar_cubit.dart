import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_bar_state.dart';

class BottomBarCubit extends Cubit<int> {
  BottomBarCubit() : super(0);

  void onTap(int index) {
    emit(index);
  }
}
