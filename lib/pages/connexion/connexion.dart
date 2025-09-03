import 'package:demai_app/data/palletCouleurs.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConnexionScreen extends StatefulWidget {
  const ConnexionScreen({super.key});

  @override
  State<ConnexionScreen> createState() => _ConnexionScreenState();
}

class _ConnexionScreenState extends State<ConnexionScreen> {
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallet.backgroundColor,
      body: Stack(
        children: [
          // Background
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/background.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 90, left: 20),
                color: const Color(0xFF3b5999).withOpacity(.85),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Signin to Continue",
                      style: TextStyle(letterSpacing: 1, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Formulaire
          Positioned(
            top: 200,
            child: Container(
              height: 280,
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Onglets Connexion / Inscription
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "CONNEXION",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 3),
                            height: 2,
                            width: 60,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            "/InscriptionScreen",
                          );
                        },
                        child: const Text(
                          "INSCRIPTION",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Champs
                  buildTextField(Icons.email, "Email", false, true),
                  buildTextField(Icons.lock, "Password", true, false),

                  // Options
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: isRememberMe,
                            activeColor: Pallet.textColor2,
                            onChanged: (value) {
                              setState(() {
                                isRememberMe = !isRememberMe;
                              });
                            },
                          ),
                          const Text("Remember me"),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Bouton Login
          buildBottomHalfContainer(),

          // Réseaux sociaux
          Positioned(
            top: MediaQuery.of(context).size.height - 120,
            right: 0,
            left: 0,
            child: Column(
              children: [
                const Text("Or Signin with"),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildTextButton(
                        FontAwesomeIcons.facebookF,
                        "Facebook",
                        Pallet.facebookColor,
                      ),
                      buildTextButton(
                        FontAwesomeIcons.google,
                        "Google",
                        Pallet.googleColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomHalfContainer() {
    return Positioned(
      top: 480,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.3),
                spreadRadius: 1.5,
                blurRadius: 10,
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange.shade200, Colors.red.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(Icons.arrow_forward, color: Colors.white),
          ),
        ),
      ),
    );
  }

  TextButton buildTextButton(IconData icon, String title, Color color) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        side: const BorderSide(width: 1, color: Colors.grey),
        minimumSize: const Size(145, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: color,
        foregroundColor: Colors.white,
      ),
      child: Row(children: [Icon(icon), const SizedBox(width: 5), Text(title)]),
    );
  }

  Widget buildTextField(
    IconData icon,
    String hintText,
    bool isPassword,
    bool isEmail,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Pallet.iconColor),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Pallet.textColor1),
            borderRadius: const BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Pallet.textColor1),
            borderRadius: const BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
        ),
      ),
    );
  }
}
