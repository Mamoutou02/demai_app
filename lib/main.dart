import 'package:flutter/material.dart';
import 'pages/onboarding.dart';
import 'connexion/connexion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demai App',
      initialRoute: "/", // Onboarding est la page initiale
      routes: {
        "/": (context) => const Onboarding(),
        "/connexion": (context) => const Connexion(),
      },
    );
  }
}
