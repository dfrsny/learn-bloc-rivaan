import 'package:flutter/material.dart';
import 'package:learn_bloc/features/auth/presentation/pages/signup_page.dart';
import 'package:learn_bloc/features/auth/presentation/widgets/auth_field.dart';
import 'package:learn_bloc/features/auth/presentation/widgets/auth_button.dart';
import 'package:learn_bloc/core/constant/app_constant.dart';
import 'package:learn_bloc/core/theme/app_pallete.dart';

class SignInPage extends StatefulWidget {
  static MaterialPageRoute<dynamic> route() =>
      MaterialPageRoute(builder: (context) => SignInPage());

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
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
                "Sign In.",
                style: TextStyle(
                  fontSize: AppConstant.fontSizeHeading1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
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
              AuthButton(buttonText: "Sign In"),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    SignUpPage.route(),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppConstant.fontSizeBody,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign Up",
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
