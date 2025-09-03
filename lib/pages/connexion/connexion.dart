import 'package:demai_app/data/palletCouleurs.dart';
import 'package:demai_app/pages/donateurs/donateurs.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:demai_app/data/responsive.dart'; 

class ConnexionScreen extends StatefulWidget {
  const ConnexionScreen({super.key});

  @override
  State<ConnexionScreen> createState() => _ConnexionScreenState();
}

class _ConnexionScreenState extends State<ConnexionScreen> {
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    final res = Responsive(context);

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
              height: res.hp(0.4),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(top: res.hp(0.12), left: res.wp(0.05)),
                //color: const Color.fromARGB(255, 72, 189, 117).withOpacity(.85),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Content de te revoir",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Connectez-vous pour continuer",
                      style: TextStyle(letterSpacing: 1, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Formulaire
          Positioned(
            top: res.hp(0.3),
            child: Container(
              padding: EdgeInsets.all(res.wp(0.05)),
              width: res.wp(0.9),
              margin: EdgeInsets.symmetric(horizontal: res.wp(0.05)),
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
                              margin: EdgeInsets.only(top: res.hp(0.005)),
                              height: 2,
                              width: res.wp(0.15),
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
                    SizedBox(height: res.hp(0.03)),

                    // Champs
                    buildTextField(Icons.email, "Email", false, true),
                    buildTextField(Icons.lock, "Password", true, false),

                    // Options Remember me / Forgot Password
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
                            Text("Remember me", style: TextStyle(fontSize: res.text(0.015))),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(fontSize: res.text(0.015)),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: res.hp(0.02)),

                    // 🔶 Bouton Orange collé à la carte
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const donateur()),
                        );
                      },
                      child: Container(
                        height: res.wp(0.22),
                        width: res.wp(0.22),
                        padding: EdgeInsets.all(res.wp(0.04)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(res.wp(0.5)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.3),
                              spreadRadius: res.wp(0.01),
                              blurRadius: res.wp(0.04),
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
                            borderRadius: BorderRadius.circular(res.wp(0.08)),
                          ),
                          child: const Icon(Icons.arrow_forward, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Réseaux sociaux
          Positioned(
            top: res.hp(0.85),
            right: 0,
            left: 0,
            child: Column(
              children: [
                const Text("Connectez-vous avec"),
                SizedBox(height: res.hp(0.015)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTextButton(FontAwesomeIcons.facebookF, "Facebook", Pallet.facebookColor),
                    buildTextButton(FontAwesomeIcons.google, "Google", Pallet.googleColor),
                  ],
                ),
              ],
            ),
          ),
        ],
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

  Widget buildTextField(IconData icon, String hintText, bool isPassword, bool isEmail) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
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
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
        ),
      ),
    );
  }
}
