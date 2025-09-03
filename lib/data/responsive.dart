// lib/utils/responsive.dart
import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;
  final Size _size;

  Responsive(this.context) : _size = MediaQuery.of(context).size;

  /// Largeur de l'écran
  double get width => _size.width;

  /// Hauteur de l'écran
  double get height => _size.height;

  /// Largeur proportionnelle (par exemple 0.8 = 80% de la largeur)
  double wp(double percentage) => width * percentage;

  /// Hauteur proportionnelle (par exemple 0.5 = 50% de la hauteur)
  double hp(double percentage) => height * percentage;

  /// Taille de texte adaptative
  double text(double scale) => (width + height) / 2 * scale;

  /// Padding/Margin proportionnel
  EdgeInsets paddingAll(double scale) => EdgeInsets.all(width * scale);

  EdgeInsets paddingSymmetric({double vertical = 0, double horizontal = 0}) =>
      EdgeInsets.symmetric(
          vertical: height * vertical, horizontal: width * horizontal);

  /// Exemple : bouton circulaire responsive
  double circleButtonSize(double scale) => width * scale;
}
