import 'dart:async';

import 'package:ayna_ui_assignment/Screens/ChatScreen/ui/ChatScreen.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBlocBloc() : super(AuthBlocInitial()) {
    on<OnSignUpButtonClickedEvent>(onSignUpButtonClickedEvent);
    on<OnSignUpReturnButtonClickedEvent>(onSignUpReturnButtonClickedEvent);
    on<OnCreateAccountButtonClickedEvent>(onCreateAccountButtonClickedEvent);
    on<OnLoginButtonClickedEvent>(onLoginButtonClickedEvent);
  }

  FutureOr<void> onSignUpButtonClickedEvent(
      OnSignUpButtonClickedEvent event, Emitter<AuthBlocState> emit) {
    emit(AuthBlocSignUpState());
  }

  FutureOr<void> onSignUpReturnButtonClickedEvent(
      OnSignUpReturnButtonClickedEvent event, Emitter<AuthBlocState> emit) {
    emit(AuthBlocInitial());
  }

  FutureOr<void> onCreateAccountButtonClickedEvent(
      OnCreateAccountButtonClickedEvent event, Emitter<AuthBlocState> emit) {
    emit(AuthBlocLoading());
    if (FirebaseAuth.instance.currentUser == null) {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.username, password: event.password);
      Navigator.of(event.context)
          .push(MaterialPageRoute(builder: (context) => const ChatScreen()));
      emit(AuthBlocInitial());
    } else {
      FirebaseAuth.instance.signOut();
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.username, password: event.password);
      Navigator.of(event.context)
          .push(MaterialPageRoute(builder: (context) => const ChatScreen()));
      emit(AuthBlocInitial());
    }
  }

  FutureOr<void> onLoginButtonClickedEvent(
      OnLoginButtonClickedEvent event, Emitter<AuthBlocState> emit) {
    emit(AuthBlocLoading());
    if (FirebaseAuth.instance.currentUser == null) {
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.username, password: event.password);
      Navigator.of(event.context)
          .push(MaterialPageRoute(builder: (context) => const ChatScreen()));
      emit(AuthBlocInitial());
    } else {
      FirebaseAuth.instance.signOut();
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.username, password: event.password);
      Navigator.of(event.context)
          .push(MaterialPageRoute(builder: (context) => const ChatScreen()));
      emit(AuthBlocInitial());
    }
  }
}
