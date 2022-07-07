part of '../../../blocs/bottom_bar_bloc/current_page_bloc.dart';

@immutable
abstract class CurrentPageEvent {}

class OnPressEvent extends CurrentPageEvent {
  final int index;

  OnPressEvent(this.index);

}
