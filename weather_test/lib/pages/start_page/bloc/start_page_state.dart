part of 'start_page_bloc.dart';

@immutable
abstract class StartPageState {}

class StartPageInitial extends StartPageState {}

class StartPageLoading extends StartPageState {}

class StartPageSuccess extends StartPageState {}

class StartPageError extends StartPageState {}
