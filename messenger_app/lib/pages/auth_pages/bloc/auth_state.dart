part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class Authenticated extends AuthState {}

class UnAuthenticated extends AuthState {}

class Loading extends AuthState {}

class AuthError extends AuthState {
  final String errorMessage;

  AuthError({required this.errorMessage});
}

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
