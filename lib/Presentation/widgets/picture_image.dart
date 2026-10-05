// widgets/picture_image.dart
import 'package:find_my_apartment/Domain/model/picture_model.dart';
import 'package:flutter/material.dart';

class PictureImage extends StatelessWidget {
  final Picture picture;
  final BoxFit fit;

  const PictureImage({super.key, required this.picture, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return picture.isAsset
        ? Image.asset(picture.path, fit: fit)
        : Image.network(
            picture.path,
            fit: fit,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return const Center(child: CircularProgressIndicator());
            },
            errorBuilder: (_, __, ___) =>
                const Center(child: Icon(Icons.broken_image)),
          );
  }
}