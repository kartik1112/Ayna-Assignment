part of 'chat_bloc_bloc.dart';

@immutable
sealed class ChatBlocState {}

final class ChatBlocInitial extends ChatBlocState {}
final class ChatBlocSuccess extends ChatBlocState {}
final class ChatBlocFailure extends ChatBlocState {}
final class ChatBlocLoading extends ChatBlocState {}
