import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:messenger_app/utils/firebase_constants.dart';
import 'package:meta/meta.dart';

import '../../../models/user_model.dart';
import '../../../services/current_user_data.dart';
import '../../../services/shared_preferences_service.dart';

part 'set_current_user_state.dart';

class SetCurrentUserCubit extends Cubit<SetCurrentUserState> {
  SetCurrentUserCubit() : super(Loading());

  Future<void> setCurrentUser() async {
    emit(Loading());
    try {
      String? newToken = await FirebaseMessaging.instance.getToken();
      SharedPreferencesService().getUserInfoSharedPreferences().then((json) {
        if (json == null) {
          emit(UnidentifiedCurrentUser());
        } else {
          UserModel userModel = UserModel.fromJson(jsonDecode(json));
          if (userModel.token == newToken) {
            CurrentUserData.currentUser = userModel;
          } else {
            UserModel userWithNewToken = userModel.copyWith(token: newToken);
            CurrentUserData.currentUser = userWithNewToken;
            FirebaseFirestore.instance
                .collection(FirebaseConstants.userCollectionName)
                .doc(userWithNewToken.id)
                .set(userWithNewToken.toJson());
          }
          emit(IdentifiedCurrentUser());
        }
      });
    } catch (e) {
      emit(Error(errorMessage: e.toString()));
    }
  }
}
