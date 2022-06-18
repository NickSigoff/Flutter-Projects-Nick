import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/user_model.dart';
import '../../../services/current_user_data.dart';
import '../../../services/shared_preferences_service.dart';

part 'set_current_user_state.dart';

class SetCurrentUserCubit extends Cubit<SetCurrentUserState> {
  SetCurrentUserCubit() : super(UnidentifiedCurrentUser());

  Future<void> setCurrentUser() async {
    try {
      emit(Loading());
      await SharedPreferencesService()
          .getUserInfoSharedPreferences()
          .then((json) {
        if (json == null) {
          emit(UnidentifiedCurrentUser());
        } else {
          UserModel userModel = UserModel.fromJson(jsonDecode(json));
          CurrentUserData.currentUser = userModel;
          emit(IdentifiedCurrentUser());
        }
      });
    } catch (e) {
      emit(Error(errorMessage: e.toString()));
    }
  }
}
