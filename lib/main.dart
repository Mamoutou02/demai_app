import 'package:demai_app/pages/connexion/connexion.dart';
import 'package:demai_app/pages/inscription/inscription.dart';
import 'package:flutter/material.dart';
import 'pages/onboarding.dart';

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
        "/InscriptionScreen": (context) => const InscriptionScreen(),
        "/ConnexionScreen": (context) => const ConnexionScreen(),
      },
    );
  }
}
