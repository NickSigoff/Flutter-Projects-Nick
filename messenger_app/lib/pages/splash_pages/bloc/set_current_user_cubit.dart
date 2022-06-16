import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/user_model.dart';
import '../../../services/current_user_data.dart';
import '../../../services/shared_preferences_service.dart';

part 'set_current_user_state.dart';

class SetCurrentUserCubit extends Cubit<SetCurrentUserState> {
  SetCurrentUserCubit() : super(UnidentifiedCurrentUser());

  Future<void> setCurrentsUser() async {
    try {
      emit(Loading());
      String? json =
          await SharedPreferencesService().getUserInfoSharedPreferences();
      UserModel userModel = json == null
          ? UserModel(
              id: 'Undefined id',
              name: 'Undefined name',
              email: 'Undefined email',
              chatRoomList: [])
          : UserModel.fromJson(jsonDecode(json));
      CurrentUserData.currentUser = userModel;
      emit(IdentifiedCurrentUser());
    } catch (e) {
      emit(Error(errorMessage: e.toString()));
      emit(UnidentifiedCurrentUser());
    }
  }
}