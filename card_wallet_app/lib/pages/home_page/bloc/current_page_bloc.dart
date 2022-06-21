import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'current_page_event.dart';

part 'current_page_state.dart';

class CurrentPageBloc extends Bloc<CurrentPageEvent, int> {
  CurrentPageBloc() : super(0) {
    on<OnPressEvent>((event, emit) => emit(event.index));
  }
}
