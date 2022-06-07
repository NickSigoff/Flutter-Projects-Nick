import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'input_field_state.dart';

class InputFieldCubit extends Cubit<InputFieldState> {
  InputFieldCubit() : super(InputFieldInitial());
}
