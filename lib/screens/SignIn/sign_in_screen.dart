import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/router/routes.dart';
import 'package:flutter_learn/widgets/custom_button.dart';
import 'package:flutter_learn/widgets/custom_link_button.dart';
import 'package:flutter_learn/widgets/custom_scaffold.dart';
import 'package:flutter_learn/widgets/custom_text_field.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            controller: emailController,
            label: "Email",
          ),
          AppConstants.textFieldGap,
          CustomTextField(
            controller: passwordController,
            label: "Password",
            secure: true,
          ),
          AppConstants.textFieldGap,
          CustomButton(
            label: "Sigin In",
            onPressed: () async {
              try {
                var authenticate = await _auth.createUserWithEmailAndPassword(
                    email: emailController.value.text,
                    password: passwordController.value.text);
              } catch (er) {}
            },
          ),
          AppConstants.textFieldGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("don't have a account "),
              CustomLinkButton(
                buttonText: 'Sign Up',
                onTap: () {
                  context.goNamed(AppRoutes.signUp);
                },
              )
            ],
          )
        ],
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
