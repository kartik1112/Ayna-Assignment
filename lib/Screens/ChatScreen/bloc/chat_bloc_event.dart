part of 'chat_bloc_bloc.dart';

@immutable
sealed class ChatBlocEvent {}

class OnSendMessageButtonPressed extends ChatBlocEvent{}
