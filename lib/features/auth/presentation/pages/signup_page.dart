import 'package:flutter/material.dart';
import 'package:learn_bloc/features/auth/presentation/pages/signin_page.dart';
import 'package:learn_bloc/features/auth/presentation/widgets/auth_field.dart';
import 'package:learn_bloc/features/auth/presentation/widgets/auth_button.dart';
import 'package:learn_bloc/core/constant/app_constant.dart';
import 'package:learn_bloc/core/theme/app_pallete.dart';

class SignUpPage extends StatefulWidget {
  static MaterialPageRoute<dynamic> route() =>
      MaterialPageRoute(builder: (context) => SignUpPage());

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    formKey.currentState?.validate();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Sign Up.",
                style: TextStyle(
                  fontSize: AppConstant.fontSizeHeading1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              AuthField(
                hintText: "Username",
                controller: usernameController,
              ),
              SizedBox(height: 15),
              AuthField(
                hintText: "Email",
                controller: emailController,
              ),
              SizedBox(height: 15),
              AuthField(
                hintText: "Password",
                controller: passwordController,
                isObscureText: true,
              ),
              SizedBox(height: 40),
              AuthButton(buttonText: "Sign Up"),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInPage(),
                    ),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppConstant.fontSizeBody,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign In",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                              color: AppPallete.gradient1,
                              fontSize:
                                  AppConstant.fontSizeBody,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
