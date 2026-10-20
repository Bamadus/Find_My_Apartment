import 'package:find_my_apartment/Domain/model/picture_model.dart';
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
        backgroundColor: const Color(0xffF8F7F4),
        title: const Text('My Favorites'),
      ),

      body: Column(
        children: [
          SizedBox(
            height: 180,
            child: Lottie.asset(
              'assets/lotties/Home2.json',
            ),
          ),

          const Divider(
            thickness: 0.5,
            indent: 20,
            endIndent: 20,
          ),

          const SizedBox(height: 10),

          Expanded(
            child: Consumer<LikeProvider>(
              builder: (context, provider, _) {
                final liked = provider.liked_Cat_Pictures;
                if (liked.isEmpty) {
                  return const Center(
                    child: Text(
                      'No liked properties yet 💔.',
                      style: TextStyle(fontSize: 17),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: liked.length,

                  itemBuilder: (context, index) {
                    final Picture pic = liked[index];

                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),

                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            pic.path,
                            width: 65,
                            height: 65,
                            fit: BoxFit.cover,
                          ),
                        ),

                        title: Text(
                          pic.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        subtitle: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(pic.location),
                            Text(pic.price),
                          ],
                        ),

                        trailing: LikeButton(
                          type: LikeType.cat_pictures,
                          id: pic.id,
                          style: LikeButtonStyle.cat_picture,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}