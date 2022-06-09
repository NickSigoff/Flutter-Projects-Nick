part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthVisiblePasswordSignIn extends AuthState {
  final bool visiblePassword = true;
}

class AuthNotVisiblePasswordSignIn extends AuthState {
  final bool visiblePassword = false;
}

class AuthVisiblePasswordSignUp extends AuthState {
  final bool visiblePassword = true;
}

class AuthNotVisiblePasswordSignUp extends AuthState {
  final bool visiblePassword = false;
}
