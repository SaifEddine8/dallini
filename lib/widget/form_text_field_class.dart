import 'package:flutter/material.dart';

class FormTextFieldClass extends StatelessWidget {
  final String hint;
  final String label;
  final TextEditingController controller;
  final IconData? preIcon;
  final Widget? suffIcon;
  final bool obscure;
  final String? Function(String?)? validator;
  
  const FormTextFieldClass({super.key,required this.controller,required this.hint,required this.label, this.obscure=false, this.preIcon, this.suffIcon, this.validator,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        hintText: hint,
        labelText: label,
        suffixIcon: suffIcon,
        prefixIcon: Icon(preIcon),
      
      ),
      obscureText: obscure,
    );
  }
}