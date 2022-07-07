part of '../../../blocs/auth_bloc/auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class PressSignInEvent extends AuthEvent {
  final String userEmail;
  final String userPassword;

  PressSignInEvent({
    required this.userEmail,
    required this.userPassword,
  });
}

class PressSignUpEvent extends AuthEvent {
  final String userName;
  final String userEmail;
  final String userPassword;

  PressSignUpEvent({
    required this.userName,
    required this.userEmail,
    required this.userPassword,
  });
}

class PressSignOutEvent extends AuthEvent {}

class PressSignInSignUpNavigationEvent extends AuthEvent {}

class PressGetStarted extends AuthEvent {}
