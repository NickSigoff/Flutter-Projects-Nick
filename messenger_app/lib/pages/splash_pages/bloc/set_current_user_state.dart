part of 'set_current_user_cubit.dart';

@immutable
abstract class SetCurrentUserState {}

class UnidentifiedCurrentUser extends SetCurrentUserState {}

class IdentifiedCurrentUser extends SetCurrentUserState {}

class Loading extends SetCurrentUserState {}

class Error extends SetCurrentUserState {
  final String errorMessage;

  Error({required this.errorMessage});
}
