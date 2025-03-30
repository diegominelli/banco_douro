import 'package:banco_douro/ui/styles/colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/banner.png"),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset("assets/stars.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 128),
                Image.asset("assets/logo.png", width: 120),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 32),
                    const Text(
                      "Sistema de Gestão de Contas",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(height: 32),
                    const TextField(
                      decoration: InputDecoration(
                        label: Text("E-mail"),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text("Senha"),
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "home");
                      },
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.orange,
                        ),
                      ),
                      child: const Text(
                        "Entrar",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
