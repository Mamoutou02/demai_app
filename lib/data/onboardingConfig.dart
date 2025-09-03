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
        "Chaque geste anti-gaspi est une réponse concrète à ceux qui manquent de tout.",
    backgroundColor: const Color(0xffF0CF69),
  ),
  UnbordingContent(
    image: "assets/images/demarage2.svg",
    title: "Mangeons juste, jetons moins",
    discription:
        "Chaque repas bien pensé est une victoire contre le gaspillage et pour la planète",
    backgroundColor: const Color(0xffB7ABFD),
  ),
  UnbordingContent(
    image: "assets/images/demarage3.svg",
    title: "La faim ne se combat pas avec des déchets",
    discription:
        "En valorisant chaque aliment, tu participes à un monde plus juste et solidaire.",
    backgroundColor: const Color(0xff95B6FF),
  ),
  UnbordingContent(
    image: "assets/images/demarage4.svg",
    title: "Moins de gaspillage, plus d’espoir",
    discription:
        "Réduire le gaspillage, c’est nourrir l’avenir de ceux qui en ont besoin aujourd’hui",
    backgroundColor: const Color(0xff95B6FF),
  ),
];
