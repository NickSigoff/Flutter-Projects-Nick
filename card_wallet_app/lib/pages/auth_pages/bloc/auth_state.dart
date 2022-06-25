part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class UnauthenticatedState extends AuthState {}

class AuthenticatedState extends AuthState {}

class LoadingState extends AuthState {}

class ErrorState extends AuthState {
  final String validateNameError;
  final String validateEmailError;
  final String validatePasswordError;

  ErrorState({
    this.validateNameError = '',
    this.validateEmailError = '',
    this.validatePasswordError = '',
  });
}
