import 'package:dating_app_3/utils/designs/colors.dart';
import 'package:flutter/material.dart';

import '../utils/designs/styles.dart';

@immutable
class TextFieldState {
  final TextEditingController? controller;
  final Function()? onClick;
  final String label;
  final Widget? icon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool readOnly;
  final bool isInputUnderline;
  final int? maxLines;
  final String? Function(String?)? validator;
  final bool expands;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;


  const TextFieldState({
    this.controller,
    this.onClick,
    this.label = '',
    this.icon,
    this.keyboardType,
    this.obscureText = false,
    this.readOnly = false,
    this.isInputUnderline = true,
    this.maxLines,
    this.expands = false,
    this.textInputAction,
    this.validator,
    this.textAlign = TextAlign.start,
  });

  TextFieldState copyWith({
    TextEditingController? controller,
    Function()? onClick,
    String? label,
    Widget? icon,
    TextInputType? keyboardType,
    bool? obscureText,
    bool? readOnly,
    bool? isInputUnderline,
    int? maxLines,
    bool? expands,
    TextInputAction? textInputAction,
    TextAlign? textAlign,
    String? Function(String?)? validator,
  }) =>
      TextFieldState(
          controller: controller ?? this.controller,
          onClick: onClick ?? this.onClick,
          label: label ?? this.label,
          icon: icon ?? this.icon,
          keyboardType: keyboardType?? this.keyboardType,
          obscureText: obscureText ?? this.obscureText,
          readOnly: readOnly ?? this.readOnly,
          isInputUnderline: isInputUnderline ?? this.isInputUnderline,
          maxLines: maxLines ?? this.maxLines,
          expands: expands ?? this.expands,
          textInputAction: textInputAction ?? this.textInputAction,
          textAlign: textAlign ?? this.textAlign,
          validator: validator ?? this.validator
      );
}

class TypeField extends StatelessWidget {
  final TextFieldState state;
  final TextEditingController textEditingController;
  const TypeField({Key? key, required this.state, required this.textEditingController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      textAlign: state.textAlign,
      controller: textEditingController,
      expands: state.expands,
      readOnly: state.readOnly,
      cursorColor: theme.colorScheme.primary,
      textInputAction: state.textInputAction,
      keyboardType: state.keyboardType,
      obscureText: state.obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.red[50],
        hintText: state.label,
        // prefixIcon: const Icon(Icons.email, size: 20.0,),
        hintStyle: sHintTextStyle,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 32.0,
          vertical: 17.0,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(15)
          ),
          borderSide: BorderSide(color: Colors.transparent, width: 3.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: BorderSide(
              color: Colors.transparent, width: 3.0
          ),
        ),
        suffixIcon: state.icon,
      ),
      maxLength: state.maxLines,
    );
  }
}

class PasswordField extends StatelessWidget {
  final TextFieldState state;
  final TextEditingController textEditingController;

  const PasswordField({Key? key, required this.state, required this.textEditingController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      textAlign: state.textAlign,
      controller: textEditingController,
      expands: state.expands,
      readOnly: state.readOnly,
      cursorColor: theme.colorScheme.primary,
      textInputAction: state.textInputAction,
      keyboardType: state.keyboardType,
      obscureText: state.obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.red[50],
        hintText: state.label,
        // prefixIcon: const Icon(Icons.email, size: 20.0,),
        hintStyle: sHintTextStyle,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 32.0,
          vertical: 17.0,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(15)
          ),
          borderSide: BorderSide(color: Colors.transparent, width: 3.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: BorderSide(
              color: Colors.transparent, width: 3.0
          ),
        ),
        suffixIcon: state.icon,
      ),
      maxLength: state.maxLines,
    );
  }
}

