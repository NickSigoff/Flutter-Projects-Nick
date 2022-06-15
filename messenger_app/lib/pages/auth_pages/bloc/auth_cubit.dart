import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../services/firebase_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(UnAuthenticated());

  Future<void> emailPasswordSignIn(
      {required String email, required String password}) async {
    try {
      emit(Loading());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      await FirebaseService().downloadUserInfo();
      emit(Authenticated());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthError(errorMessage: 'No user found for that email'));
        await Future.delayed(const Duration(seconds: 2));
        emit(UnAuthenticated());
      } else if (e.code == 'wrong-password') {
        emit(AuthError(errorMessage: 'Wrong password provided for that user'));
        await Future.delayed(const Duration(seconds: 2));
        emit(UnAuthenticated());
      }
    }
  }

  Future<void> googleSignIn() async {
    try {
      emit(Loading());
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
      await Future.delayed(const Duration(seconds: 2));
      emit(UnAuthenticated());
    }
  }

  Future<void> emailPasswordSignUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      emit(Loading());
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseService().uploadUserInfo(name: name, email: email);
      emit(Authenticated());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthError(errorMessage: 'The password provided is too weak.'));
        await Future.delayed(const Duration(seconds: 2));
        emit(UnAuthenticated());
      } else if (e.code == 'email-already-in-use') {
        emit(AuthError(
            errorMessage: 'The account already exists for that email.'));
        await Future.delayed(const Duration(seconds: 2));
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
      await Future.delayed(const Duration(seconds: 2));
      emit(UnAuthenticated());
    }
  }

  Future<void> signOut() async {
    try {
      emit(Loading());
      await FirebaseAuth.instance.signOut();
      emit(UnAuthenticated());
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
      emit(Authenticated());
    }
  }

  ///
  void onTapVisiblePasswordSignIn(bool isVisiblePassword) {
    isVisiblePassword
        ? emit(AuthVisiblePasswordSignIn())
        : emit(AuthNotVisiblePasswordSignIn());
  }

  ///
  void onTapVisiblePasswordSignUp(bool isVisiblePassword) {
    isVisiblePassword
        ? emit(AuthVisiblePasswordSignUp())
        : emit(AuthNotVisiblePasswordSignUp());
  }
}
