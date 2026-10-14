import 'package:find_my_apartment/Presentation/states/like_provider.dart';
import 'package:find_my_apartment/Presentation/widgets/bottons/like_botton_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LikeButton extends StatelessWidget {
  final LikeType type;
  final String id;
  final LikeButtonStyle style;

  const LikeButton({
    super.key,
    required this.type,
    required this.id,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<LikeProvider>(
      builder: (context, provider, _) {
        final state = provider.stateFor(type, id);
        final icon = Icon(
          state.isLiked ? style.likedIcon : style.unlikedIcon,
          color: state.isLiked ? style.likedColor : style.unlikedColor,
          size: style.iconSize,
        );

        final button = InkWell(
          onTap: () => provider.toggleLike(type, id),
          child: Padding(padding: const EdgeInsets.all(8), child: icon),
        );

        return style.decoration == null
            ? button
            : Container(decoration: style.decoration, child: button);
      },
    );
  }
}