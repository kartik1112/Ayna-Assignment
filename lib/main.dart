import 'package:ayna_ui_assignment/Screens/ChatScreen/bloc/chat_bloc_bloc.dart';
import 'package:ayna_ui_assignment/Screens/LoginScreen/bloc/auth_bloc_bloc.dart';
import 'package:ayna_ui_assignment/Screens/LoginScreen/ui/loginScreen.dart';
import 'package:ayna_ui_assignment/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBlocBloc(),
        ),
        BlocProvider(
          create: (context) => ChatBlocBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 5, 43, 75)),
            textTheme: GoogleFonts.poppinsTextTheme()),
        home: const LoginScreen(),
      ),
    ),
  );
}
