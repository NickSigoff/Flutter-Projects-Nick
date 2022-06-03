import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_bar_state.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(BottomBarChatsState());

  void onTap(int index) {
    switch (index) {
      case 0:
        emit(BottomBarChatsState());
        break;
      case 1:
        emit(BottomBarCallsState());
        break;
      case 2:
        emit(BottomBarProfileState());
        break;
      default:
        emit(BottomBarChatsState());
    }
  }

  int chooseCurrentIndex(BottomBarState state) {
    if (state is BottomBarChatsState) {
      return state.pageIndex;
    } else if (state is BottomBarCallsState) {
      return state.pageIndex;
    } else if (state is BottomBarProfileState) {
      return state.pageIndex;
    } else {
      return 0;
    }
  }
}
