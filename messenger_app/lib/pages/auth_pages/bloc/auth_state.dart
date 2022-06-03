part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthVisiblePasswordSignIn extends AuthState {
  final bool visiblePassword;

  AuthVisiblePasswordSignIn({this.visiblePassword = true});
}

class AuthVisiblePasswordSignUp extends AuthState {
  final bool visiblePassword;

  AuthVisiblePasswordSignUp({this.visiblePassword = true});
}
