import 'package:flutter/material.dart';
import 'package:flutter_learn/components/custom_scaffold.dart';
import 'package:flutter_learn/components/custom_text_field.dart';
import 'package:flutter_learn/constants/constatnt.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
