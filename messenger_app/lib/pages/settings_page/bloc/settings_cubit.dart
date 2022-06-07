import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../services/shared_preferences_methods.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsSignIn());

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
    await SharedPreferencesMethods.setUserNameSharedPreferences('Default name');
    await SharedPreferencesMethods.setUserEmailSharedPreferences(
        'Default email');
    await SharedPreferencesMethods.setUserIdSharedPreferences('Default id');
  }
}
