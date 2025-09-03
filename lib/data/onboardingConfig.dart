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
    title: "Find Food You Love",
    discription:
        "Discover the best foods from over 1,000\nrestaurants and fast delivery to your doorstep",
    backgroundColor: const Color(0xffF0CF69),
  ),
  UnbordingContent(
    image: "assets/images/demarage2.svg",
    title: "Fast Delivery",
    discription:
        "Fast food delivery to your home, office\nwherever you are just stay at home with us",
    backgroundColor: const Color(0xffB7ABFD),
  ),
  UnbordingContent(
    image: "assets/images/demarage3.svg",
    title: "Live Tracking",
    discription:
        "Real time tracking of your food on the app\nonce you placed the order",
    backgroundColor: const Color(0xff95B6FF),
  ),
  UnbordingContent(
    image: "assets/images/demarage4.svg",
    title: "Live Tracking",
    discription:
        "Real time tracking of your food on the app\nonce you placed the order",
    backgroundColor: const Color(0xff95B6FF),
  ),
];