import 'package:flutter/material.dart';
import 'package:flutter_food_app/views/widgets/login-form.dart';
import 'package:flutter_food_app/views/widgets/register-form.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  var _isLoginForm = true;

  void changeForm() {
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Image.asset('assets/images/banner.png'),
              ),
            ),
          ),
          Expanded(
            flex: _isLoginForm ? 1 : 3,
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              margin: const EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: _isLoginForm
                    ? LoginForm(changeForm: changeForm)
                    : RegisterForm(changeForm: changeForm),
              ),
            ),
          )
        ],
      ),
    );
  }
}
