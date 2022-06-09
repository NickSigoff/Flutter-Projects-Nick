import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../services/shared_preferences_service.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsSignIn());

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
    await SharedPreferencesService.setUserNameSharedPreferences('Default name');
    await SharedPreferencesService.setUserEmailSharedPreferences(
        'Default email');
    await SharedPreferencesService.setUserIdSharedPreferences('Default id');
  }
}
