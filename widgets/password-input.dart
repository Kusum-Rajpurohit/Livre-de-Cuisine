import 'package:flutter/material.dart';
import '../constants.dart';

class PasswordInput extends StatefulWidget {
  PasswordInput({
    Key? key,
    required this.icon,
    required this.hint,
    this.inputType,
    this.inputAction,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool passenable = true;
  // regular expression to check if string
  RegExp pass_valid = RegExp(r"(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}");
  //A function that validate user entered password
  bool validatePassword(String pass){
    String _password = pass.trim();
    if(pass_valid.hasMatch(_password)){
      return true;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: TextFormField(
              obscureText: passenable,
              style: kBodyText,
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
                suffixIcon: IconButton(
                  icon: Icon(passenable == true ?Icons.visibility_off :Icons.visibility),
                  onPressed: (){
                    passenable = !passenable;
                    setState(() {});
                    },
                  ),
            ),
            keyboardType: widget.inputType,
            textInputAction: widget.inputAction,
            validator: (value){
              if(value!.isEmpty){
                return "Please enter password";
              }else{
                bool result = validatePassword(value);
                if(result){
                  return null;
                }else{
                  return " Password should contain Capital, small letter & Number & Special";
                }
              }
            },
            ),
          ),
        ),
    );
  }
}
