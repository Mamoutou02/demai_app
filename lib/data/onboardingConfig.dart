import 'package:flutter/material.dart';

class UnbordingContent {
  final String image;
  final String title;
  final String discription;
  final Color backgroundColor;

  UnbordingContent({
    required this.image,
    required this.title,
    required this.discription,
    required this.backgroundColor,
  });
}

// Create a list of UnbordingContent objects
List<UnbordingContent> contentsList = [
  UnbordingContent(
    image: "assets/images/demarage1.svg",
    title: "Un repas sauvé, une vie respectée",
    discription:
        "Chaque geste anti-gaspi est une réponse concrète à ceux qui manquent de tout",
    backgroundColor: const Color(0xffF0CF69),
  ),
  UnbordingContent(
    image: "assets/images/demarage2.svg",
    title: "Moins de gaspillage, plus d’espoir",
    discription:
        "Réduire le gaspillage, c’est nourrir l’avenir de ceux qui en ont besoin aujourd’hui",
    backgroundColor: const Color(0xffB7ABFD),
  ),
  UnbordingContent(
    image: "assets/images/demarage3.svg",
    title: "Gaspiller, c’est ignorer la faim",
    discription:
        " Choisis la solidarité : chaque aliment préservé est un pas vers l’équité",
    backgroundColor: const Color(0xff95B6FF),
  ),
  UnbordingContent(
    image: "assets/images/demarage4.svg",
    title: "Ton assiette peut changer le monde",
    discription:
        "En cuisinant avec conscience, tu deviens acteur de la lutte contre la faim",
    backgroundColor: const Color(0xff95B6FF),
  ),
];