part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocState {}

final class AuthBlocInitial extends AuthBlocState {}
final class AuthBlocSuccess extends AuthBlocState {}
final class AuthBlocFailure extends AuthBlocState {}
final class AuthBlocLoading extends AuthBlocState {}
final class AuthBlocSignUpState extends AuthBlocState {}
