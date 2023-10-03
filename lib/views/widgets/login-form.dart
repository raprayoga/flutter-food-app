import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.changeForm});
  final void Function() changeForm;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(label: Text('Email')),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(label: Text('Password')),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                  backgroundColor: Theme.of(context).colorScheme.primary),
              child: const Text('Login', style: TextStyle(color: Colors.white)),
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            TextButton(
                onPressed: () {
                  widget.changeForm();
                },
                child: const Text('belum memiliki akun ?'))
          ],
        ),
      ),
    );
  }
}
