import 'package:demai_app/data/palletCouleurs.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:demai_app/data/responsive.dart';
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
    final res = Responsive(context);

    return Scaffold(
      backgroundColor: Pallet.backgroundColor,
      body: Stack(
        children: [
          /// Background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: res.hp(0.35),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg2.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(top: res.hp(0.12), left: res.wp(0.05)),
                //color: const Color.fromARGB(255, 72, 189, 117).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Bienvenue à",
                        style: TextStyle(
                          fontSize: res.text(0.035),
                          letterSpacing: 2,
                          color: Colors.yellow[700],
                        ),
                        children: const [
                          TextSpan(
                            text: " Demai-App,",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: res.hp(0.01)),
                    Text(
                      "Inscrivez-vous pour continuer",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                        fontSize: res.text(0.018),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Formulaire + bouton collé
          Positioned(
            top: res.hp(0.25),
            child: Container(
              padding: res.paddingAll(0.05),
              width: res.wp(0.9),
              margin: EdgeInsets.symmetric(horizontal: res.wp(0.05)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(res.wp(0.03)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: res.wp(0.04),
                    spreadRadius: res.wp(0.01),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        /// Onglets Inscription / Connexion
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "INSCRIPTION",
                                  style: TextStyle(
                                    fontSize: res.text(0.02),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: res.hp(0.005)),
                                  height: res.hp(0.0025),
                                  width: res.wp(0.2),
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
                              child: Text(
                                "CONNEXION",
                                style: TextStyle(
                                  fontSize: res.text(0.02),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: res.hp(0.02)),

                        /// Champs
                        buildTextField(Icons.person, "Username", false, false, res),
                        buildTextField(Icons.email, "Email", false, true, res),
                        buildTextField(Icons.lock, "Password", true, false, res),

                        /// Choix du rôle (Donateur / Receveur)
                        Padding(
                          padding: EdgeInsets.only(top: res.hp(0.01)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () => setState(() => isMale = true),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isMale
                                      ? Pallet.textColor2
                                      : Colors.grey.shade200,
                                  foregroundColor:
                                      isMale ? Colors.white : Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(res.wp(0.04)),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: res.wp(0.05),
                                    vertical: res.hp(0.015),
                                  ),
                                ),
                                icon: const Icon(Icons.volunteer_activism),
                                label: Text(
                                  "Donateur",
                                  style: TextStyle(fontSize: res.text(0.016)),
                                ),
                              ),
                              SizedBox(width: res.wp(0.05)),
                              ElevatedButton.icon(
                                onPressed: () => setState(() => isMale = false),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: !isMale
                                      ? Pallet.textColor2
                                      : Colors.grey.shade200,
                                  foregroundColor:
                                      !isMale ? Colors.white : Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(res.wp(0.04)),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: res.wp(0.05),
                                    vertical: res.hp(0.015),
                                  ),
                                ),
                                icon: const Icon(Icons.person),
                                label: Text(
                                  "Receveur",
                                  style: TextStyle(fontSize: res.text(0.016)),
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// Terms
                        Padding(
                          padding: res.paddingSymmetric(
                              vertical: 0.03, horizontal: 0.04),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              text:
                                  "En appuyant sur « Soumettre », vous acceptez nos ",
                              style: TextStyle(color: Colors.black54),
                              children: [
                                TextSpan(
                                  text: "Conditions générales",
                                  style: TextStyle(color: Colors.orange),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// ✅ Bouton Submit collé
                  SizedBox(height: res.hp(0.01)),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, "/ConnexionScreen"),
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

          /// Réseaux sociaux
          Positioned(
            top: res.hp(0.9),
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  "Ou inscrivez-vous avec",
                  style: TextStyle(fontSize: res.text(0.015), color: Colors.black54),
                ),
                Container(
                  margin: EdgeInsets.only(top: res.hp(0.015)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildTextButton(
                        FontAwesomeIcons.facebookF,
                        "Facebook",
                        Pallet.facebookColor,
                        res,
                      ),
                      buildTextButton(
                        FontAwesomeIcons.google,
                        "Google",
                        Pallet.googleColor,
                        res,
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

  TextButton buildTextButton(
      IconData icon, String title, Color color, Responsive res) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        minimumSize: Size(res.wp(0.35), res.hp(0.05)),
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(res.wp(0.05))),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: res.text(0.02)),
          SizedBox(width: res.wp(0.02)),
          Text(title)
        ],
      ),
    );
  }

  Widget buildTextField(
      IconData icon, String hintText, bool isPassword, bool isEmail, Responsive res) {
    return Padding(
      padding: EdgeInsets.only(bottom: res.hp(0.015)),
      child: TextField(
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Pallet.iconColor),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Pallet.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(res.wp(0.09))),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Pallet.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(res.wp(0.09))),
          ),
          contentPadding: EdgeInsets.all(res.wp(0.03)),
          hintText: hintText,
        ),
      ),
    );
  }
}
