import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, required this.changeForm});
  final void Function() changeForm;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(label: Text('Name')),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(label: Text('Email')),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(label: Text('Password')),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(label: Text('Password Confim')),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                  backgroundColor: Theme.of(context).colorScheme.primary),
              child:
                  const Text('Register', style: TextStyle(color: Colors.white)),
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            TextButton(
                onPressed: () {
                  widget.changeForm();
                },
                child: const Text('sudah memiliki akun ?'))
          ],
        ),
      ),
    );
  }
}
