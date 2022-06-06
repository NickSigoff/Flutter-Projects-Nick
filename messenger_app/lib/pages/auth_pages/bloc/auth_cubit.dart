import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../services/firebase_methods.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<bool> uploadToSharedPreferences() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await FirebaseMethods.downloadUserInfo(currentUser.uid);
      return true;
    }
    return false;
  }

  void signIn({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccess());
    } on FirebaseAuthException catch (_) {
      emit(AuthError());
    }
  }

  void signUp({
    required String email,
    required String name,
    required String password,
    required formKey,
  }) async {
    if (formKey.currentState != null) {
      final isValid = formKey.currentState!.validate();
      if (!isValid) emit(AuthError());
    }

    try {
      emit(AuthLoading());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseMethods.uploadUserInfo(name: name, email: email);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (_) {
      emit(AuthError());
    }
  }

  void onTapVisiblePasswordSignIn(bool isVisiblePassword) {
    emit(AuthVisiblePasswordSignIn(visiblePassword: isVisiblePassword));
  }

  void onTapVisiblePasswordSignUp(bool isVisiblePassword) {
    emit(AuthVisiblePasswordSignUp(visiblePassword: isVisiblePassword));
  }
}
