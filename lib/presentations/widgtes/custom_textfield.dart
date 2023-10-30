import 'package:flutter/material.dart';
import 'package:studentlogin/utils/constants.dart/colors.dart';

class CustomTextFieldWidget extends StatefulWidget {
  const CustomTextFieldWidget({
    super.key,
    this.textInputAction = TextInputAction.next,
    required this.placeHolder,
    this.suffixIcon,
    required this.textcontroller,
    this.keyboardType,
    this.isPassword = false,
    this.validator,
    this.maxLines,
  });
  final int? maxLines;
  final TextInputAction? textInputAction;
  final String? placeHolder;
  final IconData? suffixIcon;
  final TextEditingController textcontroller;
  final TextInputType? keyboardType;
  final bool isPassword;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool passwordVisibility = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textcontroller,
      obscureText: passwordVisibility,
      validator: widget.validator,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(1.8),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: tBlackColor),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    passwordVisibility = !passwordVisibility;
                  });
                },
                icon: Icon(
                  passwordVisibility
                      ? Icons.visibility_off_outlined
                      : Icons.visibility,
                  color: tgreyColor,
                ),
              )
            : null,
        hintText: widget.placeHolder,
        filled: true,
        fillColor: tWhiteColor,
      ),
    );
  }
}
