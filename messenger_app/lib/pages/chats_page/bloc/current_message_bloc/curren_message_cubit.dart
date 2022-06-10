import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'curren_message_state.dart';

class CurrenMessageCubit extends Cubit<CurrenMessageState> {
  CurrenMessageCubit() : super(CurrenMessageInitial());
}
