// screens/liked_screen.dart
import 'package:find_my_apartment/Presentation/states/like_provider.dart';
import 'package:find_my_apartment/Presentation/widgets/bottons/like_botton.dart';
import 'package:find_my_apartment/Presentation/widgets/bottons/like_botton_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F7F4),
      appBar: AppBar(
        backgroundColor:const Color(0xffF8F7F4),
        title: const Text('Liked Pictures')
        ),
      body: Column(
        children: [
          Lottie.asset(
              'assets/lotties/Home2.json',
              ),
              Divider(
                thickness: .5,
                indent: 20,
                endIndent: 20,
              ),
              SizedBox(height: 10,),
          Consumer<LikeProvider>(
            builder: (context, provider, _) {
              final liked = provider.liked_Cat_Pictures;
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
                    trailing: LikeButton(type: LikeType.cat_pictures, id: pic.id, style: LikeButtonStyle.cat_picture), // unlike from here
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}