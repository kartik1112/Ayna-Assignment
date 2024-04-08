import 'package:ayna_ui_assignment/Screens/ChatScreen/ui/ChatScreen.dart';
import 'package:ayna_ui_assignment/Screens/LoginScreen/bloc/auth_bloc_bloc.dart';
import 'package:ayna_ui_assignment/widgets/CustomButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:ayna_ui_assignment/widgets/CustomTextFieldWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final colorSchemeTheme = Theme.of(context).colorScheme;
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final Widget SignUpScreen = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "lib/assets/logo.webp",
          height: 80,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                color: colorSchemeTheme.primaryContainer,
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "Welcome",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: colorSchemeTheme.primary),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            CustomTextFieldWidget(
                controller: nameController,
                text: "Name",
                colorSchemeTheme: colorSchemeTheme),
            const SizedBox(
              height: 10,
            ),
            CustomTextFieldWidget(
                controller: emailController,
                text: "Username",
                colorSchemeTheme: colorSchemeTheme),
            const SizedBox(
              height: 10,
            ),
            CustomTextFieldWidget(
                controller: passwordController,
                text: "Password",
                colorSchemeTheme: colorSchemeTheme),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomButtonWidget(
                      onPressed: () {
                        context.read<AuthBlocBloc>().add(
                            OnCreateAccountButtonClickedEvent(
                                nameController.text,
                                emailController.text,
                                passwordController.text,
                                context));
                      },
                      icon: Icons.app_registration_rounded,
                      text: "Signup",
                      colorSchemeTheme: colorSchemeTheme),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButtonWidget(
                      onPressed: () {
                        context
                            .read<AuthBlocBloc>()
                            .add(OnSignUpReturnButtonClickedEvent());
                      },
                      icon: Icons.arrow_back_ios_new_rounded,
                      text: "Return",
                      colorSchemeTheme: colorSchemeTheme),
                ),
              ],
            )
          ],
        ),
      ],
    );
    final Widget LoginScreen = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "lib/assets/logo.webp",
          height: 80,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                color: colorSchemeTheme.primaryContainer,
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "Welcome",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: colorSchemeTheme.primary),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            CustomTextFieldWidget(
                controller: emailController,
                text: "Username",
                colorSchemeTheme: colorSchemeTheme),
            const SizedBox(
              height: 10,
            ),
            CustomTextFieldWidget(
                controller: passwordController,
                text: "Password",
                colorSchemeTheme: colorSchemeTheme),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomButtonWidget(
                      onPressed: () {
                        // impliment login logic here
                        context.read<AuthBlocBloc>().add(
                            OnLoginButtonClickedEvent(emailController.text,
                                passwordController.text, context));
                      },
                      icon: Icons.arrow_circle_right,
                      text: "Login",
                      colorSchemeTheme: colorSchemeTheme),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButtonWidget(
                      onPressed: () {
                        context
                            .read<AuthBlocBloc>()
                            .add(OnSignUpButtonClickedEvent());
                      },
                      icon: Icons.app_registration_rounded,
                      text: "Create Account",
                      colorSchemeTheme: colorSchemeTheme),
                ),
              ],
            )
          ],
        ),
      ],
    );

    return Scaffold(
      backgroundColor: colorSchemeTheme.primary,
      body: Center(
          child: Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 20),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 130),
        decoration: BoxDecoration(
          color: colorSchemeTheme.onPrimary,
          border: Border.all(
              style: BorderStyle.solid,
              color: colorSchemeTheme.primary,
              width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: BlocBuilder<AuthBlocBloc, AuthBlocState>(
          builder: (context, state) {
            switch (state) {
              case AuthBlocInitial():
                return LoginScreen;

              case AuthBlocLoading():
                return const CircularProgressIndicator();

              case AuthBlocSignUpState():
                return SignUpScreen;
              default:
                return const CircularProgressIndicator();
            }
          },
        ),
      )),
    );
  }
}
