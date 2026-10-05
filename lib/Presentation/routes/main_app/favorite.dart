// screens/liked_screen.dart
import 'package:find_my_apartment/Presentation/states/like_provider.dart';
import 'package:find_my_apartment/Presentation/widgets/like_botton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LikedScreen extends StatelessWidget {
  const LikedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Liked Pictures')),
      body: Consumer<LikeProvider>(
        builder: (context, provider, _) {
          final liked = provider.likedPictures;

          if (liked.isEmpty) {
            return const Center(child: Text('No liked pictures yet 💔'));
          }

          return ListView.builder(
            itemCount: liked.length,
            itemBuilder: (context, i) {
              final pic = liked[i];
              return ListTile(
                leading: Image.asset(pic.path, width: 56, height: 56, fit: BoxFit.cover),
                title: Text(pic.title),
                trailing: LikeButton(pictureId: pic.id), // unlike from here
              );
            },
          );
        },
      ),
    );
  }
}