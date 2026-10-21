import 'package:flutter/material.dart';

class LikeButtonStyle {
  final IconData likedIcon;
  final IconData unlikedIcon;
  final Color likedColor;
  final Color unlikedColor;
  final double iconSize;
  final BoxDecoration? decoration;

  const LikeButtonStyle({
    required this.likedIcon,
    required this.unlikedIcon,
    required this.likedColor,
    required this.unlikedColor,
    required this.iconSize,
    this.decoration,
  });

  // Pre-built styles
  static const cat_picture = LikeButtonStyle(
    likedIcon: Icons.favorite,
    unlikedIcon: Icons.favorite_border,
    likedColor: Color(0xffa4161a),
    unlikedColor: Colors.white,
    iconSize: 28
  );

  static const other_picture = LikeButtonStyle(
    likedIcon: Icons.favorite,
    unlikedIcon: Icons.favorite_border,
    likedColor: Color(0xffa4161a),
    unlikedColor: Color(0xffadb5bd),
    iconSize: 28
    );
}