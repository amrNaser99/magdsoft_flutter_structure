part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class LoginLoadingState extends GlobalState {}
class LoginSuccessState extends GlobalState {}
class LoginErrorState extends GlobalState {}


class RegisterLoadingState extends GlobalState {}
class RegisterSuccessState extends GlobalState {}
class RegisterErrorState extends GlobalState {}


class ToggleLanguage extends GlobalState {}

