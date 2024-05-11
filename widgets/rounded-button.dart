import 'package:flutter/material.dart';
import '../constants.dart';

class RoundedButton extends StatelessWidget {
   RoundedButton({
    Key? key,
    required this.buttonName,
     required this.Button,
  }) : super(key: key);

  final String buttonName;
  final String Button;
   final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
        child : Container(
          height: size.height * 0.08,
          width: size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: kBlue,
          ),
          child: ElevatedButton(
            onPressed: () {
              if (Button == 'Login'){
                  if (_formKey.currentState!.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')));
                  }
              }
              if (Button == 'Send'){
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')));
                  }
              }
              if (Button == 'Register'){
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')));
                }
              }
            },
            child: Text(
            buttonName,
            style: kBodyText.copyWith(fontWeight: FontWeight.bold),
           ),
          ),
        ),
    );
  }
}