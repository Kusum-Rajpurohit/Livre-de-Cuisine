import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(
          image: 'assets/images/sign_in.jpg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    'Livre de Cuisine',
                    style: TextStyle(
                        fontStyle: FontStyle.italic ,
                        color: Colors.white,
                        fontSize: 70,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
             Form(
               key: _formKey,
              child : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextInputField(
                    icon: Icons.mail,
                    hint: 'Email',
                    inputAction: TextInputAction.next,
                    inputType: TextInputType.emailAddress,
                    validate: 'Email'
                  ),
                  PasswordInput(
                    icon: Icons.lock,
                    hint: 'Password',
                    inputAction: TextInputAction.done,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'ForgotPassword'),
                    child: Text(
                      'Forgot Password',
                      style: kBodyText,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  RoundedButton(
                    buttonName: 'Login',
                      Button: 'Login'
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
             ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'CreateNewAccount'),
                child: Container(
                  child: Text(
                    'Create New Account',
                    style: kBodyText,
                  ),
                  decoration: BoxDecoration(
                      border:
                      Border(bottom: BorderSide(width: 1, color: kWhite))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}