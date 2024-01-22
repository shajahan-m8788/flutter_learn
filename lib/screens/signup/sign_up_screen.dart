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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool isDisabled = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sign Up",
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
            onChanged: (_) => {handleDisabled()},
            validator: (e) => handleError(e),
          ),
          AppConstants.textFieldGap,
          CustomTextField(
            controller: passwordController,
            label: "Password",
            secure: true,
            onChanged: (_) => {handleDisabled()},
          ),
          AppConstants.textFieldGap,
          CustomTextField(
            controller: confirmPassword,
            label: "Confirm Password",
            secure: true,
            onChanged: (_) => {handleDisabled()},
          ),
          AppConstants.textFieldGap,
          CustomButton(
            label: "Sign Up",
            isDisabled: isDisabled,
            onPressed: () => signUp(),
          ),
          AppConstants.textFieldGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have a account ",
                style: font_16_500Black,
              ),
              CustomLinkButton(
                buttonText: 'Sign In',
                onTap: () {
                  context.goNamed(AppRoutes.sigIn);
                },
              )
            ],
          )
        ],
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  handleDisabled() {
    setState(() {
      isDisabled = emailReg.hasMatch(emailController.value.text) == false ||
              passwordController.value.text.isEmpty ||
              confirmPassword.value.text.isEmpty
          ? true
          : false;
    });
  }

  handleError(String? e) {
    if (emailReg.hasMatch(emailController.value.text)) {
      return null;
    } else {
      return 'Please enter valid email address';
    }
  }

  signUp() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (_formKey.currentState!.validate()) {
        try {
          var authenticate = await _auth.createUserWithEmailAndPassword(
              email: emailController.value.text,
              password: confirmPassword.value.text);
          if (context.mounted) {
            showToast(
                context: context,
                content: const Text("User created successfully",
                    style: TextStyle(color: AppColors.black)));
            context.goNamed(AppRoutes.homeScreen,
                pathParameters: {'title': "shajahan"});
          }
        } catch (er) {
          if (context.mounted) {
            showToast(
                context: context,
                snackType: SnackType.error,
                content: Text(er.toString(),
                    style: const TextStyle(color: AppColors.black)));
          }
        }
      }
    });
  }
}
