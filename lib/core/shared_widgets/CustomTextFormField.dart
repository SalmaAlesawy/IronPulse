import 'package:fitness_app/core/themes/color_palette.dart';
import 'package:flutter/material.dart';

class Customtextformfield extends StatefulWidget {
  final Widget prefixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool? obscureText;
  const Customtextformfield({
    super.key,
    required this.prefixIcon,
    required this.controller,
    this.validator,
    required this.hintText,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText=false,
  });

  @override
  State<Customtextformfield> createState() => _CustomtextformfieldState();
}

class _CustomtextformfieldState extends State<Customtextformfield> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return TextFormField(
      obscureText:widget.obscureText! ,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      controller: widget.controller,
      style: textTheme.titleLarge,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: textTheme.titleMedium?.copyWith(
          color: ColorPalette.inputTextColor,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: widget.suffixIcon,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: widget.prefixIcon,
        ),
        filled: true,
        fillColor: ColorPalette.inputColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
