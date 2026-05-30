import 'package:flutter/material.dart';
import 'package:learn_bloc/core/constant/app_constant.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool isObscureText;
  const AuthField({
    super.key, 
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstant.borderFieldRadius),
        ),
      ),
      validator: (value){
        if(value == null || value.isEmpty){
          return "Please enter your $hintText";
        }
        return null;
      },
    );
  }
}