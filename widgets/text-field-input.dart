import 'package:flutter/material.dart';
import '../constants.dart';

class TextInputField extends StatefulWidget {
  const TextInputField({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,
    required this.validate,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final String validate;

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Form(
        key: formKey,
    child : Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                  widget.icon,
                  size: 28,
                  color: kWhite,
                ),
              ),
              hintText: widget.hint,
              hintStyle: kBodyText,
            ),
            style: kBodyText,
            keyboardType: widget.inputType,
            textInputAction: widget.inputAction,
            validator: (value) {
              if (widget.validate == 'Username'){
                  if (value == null || value.isEmpty) {
                    return 'Please enter username';
                  } else if (value.length < 4) {
                    return 'At least enter 4 characters';
                  } else if (value.length > 26) {
                    return 'Maximum character is 26';
                  }
              }
              if(widget.validate == 'Email'){
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }else if(!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(value)){
                  return "Enter a valid email address";

                }
              }
             },
            ),
          ),
        ),
      ),
    );
  }
}