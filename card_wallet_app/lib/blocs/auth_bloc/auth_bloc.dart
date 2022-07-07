import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:card_wallet_app/model/user_model.dart';
import 'package:card_wallet_app/services/current_user_provider.dart';
import 'package:card_wallet_app/services/shared_preferences_service.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(UnauthenticatedState()) {
    on<PressSignInEvent>((event, emit) async {
      try {
        emit(LoadingState());
        if (_validateEmail(event.userEmail)) {
          String? userJson = await SharedPreferencesService()
              .getUserInfoSharedPreferences(event.userEmail);
          if (userJson != null) {
            UserModel userModel = UserModel.fromJson(json.decode(userJson));
            if (userModel.password == event.userPassword) {
              CurrentUserProvider.currentUser = userModel;
              await SharedPreferencesService()
                  .setCurrentUserSharedPreferences(userJson);
              emit(AuthenticatedState());
            } else {
              emit(ErrorState(
                  validatePasswordError: 'Incorrect email or password'));
            }
          } else {
            emit(ErrorState(validateEmailError: 'No profile with this email'));
          }
        } else {
          emit(ErrorState(validateEmailError: 'Incorrect email'));
        }
      } catch (e) {
        print(e);
        emit(ErrorState());
      }
    });

    on<PressSignUpEvent>((event, emit) async {
      try {
        emit(LoadingState());
        if (event.userName.trim() != '') {
          if (_validateEmail(event.userEmail)) {
            if (_validatePassword(event.userPassword)) {
              UserModel userModel = UserModel(
                  name: event.userName,
                  email: event.userEmail,
                  password: event.userPassword);
              await SharedPreferencesService().setUserInfoSharedPreferences(
                  jsonEncode(userModel.toJson()), event.userEmail);
              CurrentUserProvider.currentUser = userModel;
              emit(AuthenticatedState());
            } else {
              emit(ErrorState(
                  validatePasswordError:
                      'Incorrect password!. Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character'));
            }
          } else {
            emit(ErrorState(validateEmailError: 'Incorrect email!'));
          }
        } else {
          emit(ErrorState(validateNameError: 'Empty Name!'));
        }
      } catch (e) {
        print(e);
        emit(ErrorState());
      }
    });

    on<PressSignOutEvent>((event, emit) async {
      await SharedPreferencesService()
          .setCurrentUserSharedPreferences(json.encode(UserModel().toJson()));
      emit(UnauthenticatedState());
    });

    on<PressSignInSignUpNavigationEvent>((event, emit) {
      emit(UnauthenticatedState());
    });

    on<PressGetStarted>((event, emit) async {
      String? currentUserJson =
          await SharedPreferencesService().getCurrentUserSharedPreferences();
      if (currentUserJson != null) {
        UserModel currentUser =
            UserModel.fromJson(json.decode(currentUserJson));
        if (currentUser.email == 'Default email') {
          emit(UnauthenticatedState());
        } else {
          CurrentUserProvider.currentUser = currentUser;
          emit(AuthenticatedState());
        }
      } else {
        emit(UnauthenticatedState());
      }
    });
  }

  bool _validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(email);
  }

  bool _validatePassword(String password) {
    return RegExp(
            r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
        .hasMatch(password);
  }
}
