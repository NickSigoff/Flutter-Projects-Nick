import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'current_message_state.dart';

class CurrentMessageCubit extends Cubit<CurrentMessageState> {
  CurrentMessageCubit() : super(CurrentMessageInitial());
}
