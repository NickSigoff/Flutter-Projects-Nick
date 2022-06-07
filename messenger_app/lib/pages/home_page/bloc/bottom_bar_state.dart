part of 'bottom_bar_cubit.dart';

@immutable
abstract class BottomBarState {}

class BottomBarChatsState extends BottomBarState {
  final pageIndex = 0;
}

class BottomBarCallsState extends BottomBarState {
  final pageIndex = 1;
}

class BottomBarProfileState extends BottomBarState {
  final pageIndex = 2;
}
