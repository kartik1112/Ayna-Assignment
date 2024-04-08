part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocEvent {}

final class OnLoginButtonClickedEvent extends AuthBlocEvent {
  final String username;
  final String password;
  final BuildContext context;

  OnLoginButtonClickedEvent(this.username, this.password, this.context);
}

final class OnCreateAccountButtonClickedEvent extends AuthBlocEvent {
  final String name;
  final String username;
  final String password;
  final BuildContext context;

  OnCreateAccountButtonClickedEvent(this.name, this.username, this.password, this.context);
}

final class OnSignUpButtonClickedEvent extends AuthBlocEvent {
  OnSignUpButtonClickedEvent();
}

final class OnSignUpReturnButtonClickedEvent extends AuthBlocEvent {
  OnSignUpReturnButtonClickedEvent();
}
