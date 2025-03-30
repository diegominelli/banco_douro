import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Text("Sistema de Gestão de Contas"),
          const TextField(),
          const TextField(),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Entrar"),
          )
        ],
      ),
    );
  }
}
