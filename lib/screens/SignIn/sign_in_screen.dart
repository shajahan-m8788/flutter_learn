import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/router/routes.dart';
import 'package:flutter_learn/service/utilities.dart';
import 'package:flutter_learn/themes/app_colors.dart';
import 'package:flutter_learn/widgets/custom_button.dart';
import 'package:flutter_learn/widgets/custom_link_button.dart';
import 'package:flutter_learn/widgets/custom_scaffold.dart';
import 'package:flutter_learn/widgets/custom_text_field.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/widgets/snackbar.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isDisabled = true;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Sign In",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColors.headingColor,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 40,
        ),
        CustomTextField(
          controller: emailController,
          label: "Email",
          validator: (e) => handleError(e),
          onChanged: (_) => handleDisabled(),
        ),
        AppConstants.textFieldGap,
        CustomTextField(
          controller: passwordController,
          label: "Password",
          secure: true,
          onChanged: (_) => handleDisabled(),
        ),
        AppConstants.textFieldGap,
        CustomButton(
          label: "Sign In",
          isDisabled: isDisabled,
          onPressed: () async {
            try {
              var authenticate = await _auth.signInWithEmailAndPassword(
                  email: emailController.value.text,
                  password: passwordController.value.text);
              if (context.mounted) {
                context.goNamed(AppRoutes.homeScreen,
                    pathParameters: {'title': "shajahan"});
                showToast(
                    context: context, content: Text(authenticate.toString()));
              }
            } catch (er) {
              context.mounted
                  ? showToast(
                      context: context,
                      content: Text(er.toString()),
                      snackType: SnackType.error)
                  : null;
            }
          },
        ),
        AppConstants.textFieldGap,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "don't have a account ",
              style: font_16_500Black,
            ),
            CustomLinkButton(
              buttonText: 'Sign Up',
              onTap: () {
                context.goNamed(AppRoutes.signUp);
              },
            )
          ],
        )
      ],
    ));
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  handleError(String? e) {
    if (emailReg.hasMatch(emailController.value.text)) {
      return null;
    } else {
      return 'Please enter valid email address';
    }
  }

  handleDisabled() {
    setState(() {
      isDisabled = emailController.value.text.isEmpty ||
              passwordController.value.text.isEmpty
          ? true
          : false;
    });
  }
}
