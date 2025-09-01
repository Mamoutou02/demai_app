import 'package:flutter/material.dart';

class Connexion extends StatelessWidget {
  const Connexion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: const Center(
        child: Text(
          "Page de connexion",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
