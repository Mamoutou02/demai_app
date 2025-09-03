import 'package:demai_app/data/palletCouleurs.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InscriptionScreen extends StatefulWidget {
  const InscriptionScreen({super.key});

  @override
  State<InscriptionScreen> createState() => _InscriptionScreenState();
}

class _InscriptionScreenState extends State<InscriptionScreen> {
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallet.backgroundColor,
      body: Stack(
        children: [
          /// Background
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Welcome to",
                        style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 2,
                          color: Colors.yellow[700],
                        ),
                        children: const [
                          TextSpan(
                            text: " Rizona,",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Signup to Continue",
                      style: TextStyle(letterSpacing: 1, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Formulaire
          Positioned(
            top: 200,
            child: Container(
              height: 420,
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// Onglets Inscription / Connexion
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "INSCRIPTION",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 3),
                              height: 2,
                              width: 80,
                              color: Colors.orange,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              "/ConnexionScreen",
                            );
                          },
                          child: const Text(
                            "CONNEXION",
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

                    /// Champs
                    buildTextField(Icons.person, "Username", false, false),
                    buildTextField(Icons.email, "Email", false, true),
                    buildTextField(Icons.lock, "Password", true, false),

                    /// Choix du rôle (Donateur / Receveur)
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                isMale = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isMale
                                  ? Pallet.textColor2
                                  : Colors.grey.shade200,
                              foregroundColor: isMale
                                  ? Colors.white
                                  : Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                            ),
                            icon: const Icon(Icons.volunteer_activism),
                            label: const Text("Donateur"),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                isMale = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: !isMale
                                  ? Pallet.textColor2
                                  : Colors.grey.shade200,
                              foregroundColor: !isMale
                                  ? Colors.white
                                  : Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                            ),
                            icon: const Icon(Icons.person),
                            label: const Text("Receveur"),
                          ),
                        ],
                      ),
                    ),

                    /// Terms
                    Container(
                      width: 200,
                      margin: const EdgeInsets.only(top: 20),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: "By pressing 'Submit' you agree to our ",
                          style: TextStyle(color: Colors.black54),
                          children: [
                            TextSpan(
                              text: "Terms & Conditions",
                              style: TextStyle(color: Colors.orange),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Bouton Submit
          buildBottomHalfContainer(),

          /// Réseaux sociaux
          Positioned(
            top: MediaQuery.of(context).size.height - 120,
            right: 0,
            left: 0,
            child: Column(
              children: [
                const Text(
                  "Or Signup with",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
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

  /// ✅ Bouton Submit
  Widget buildBottomHalfContainer() {
    return Positioned(
      top: 560,
      right: 0,
      left: 0,
      child: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, "/ConnexionScreen");
          },
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
      ),
    );
  }

  TextButton buildTextButton(IconData icon, String title, Color color) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        minimumSize: const Size(140, 40),
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(icon, size: 20), const SizedBox(width: 8), Text(title)],
      ),
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
