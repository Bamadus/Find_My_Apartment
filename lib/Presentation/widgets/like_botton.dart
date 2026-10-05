// widgets/like_button.dart
import 'package:find_my_apartment/Presentation/states/like_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:find_my_apartment/Domain/model/like_state.dart';


class LikeButton extends StatelessWidget {
  final String pictureId;

  const LikeButton({super.key, required this.pictureId});

  @override
  Widget build(BuildContext context) {
    return Selector<LikeProvider, LikeState>(
      selector: (_, provider) => provider.stateFor(pictureId),
      builder: (context, state, _) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (child, animation) =>
                    ScaleTransition(scale: animation, child: child),
                child: Icon(
                  state.isLiked ? Icons.favorite : Icons.favorite_border,
                  key: ValueKey(state.isLiked),
                  color: state.isLiked ? Colors.red : Colors.grey,
                ),
              ),
              onPressed: () {
                context.read<LikeProvider>().toggleLike(pictureId);
              },
            ),
            Text(
              '${state.likeCount}',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        );
      },
    );
  }
}