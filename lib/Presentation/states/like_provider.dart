// providers/like_provider.dart
import 'package:flutter/foundation.dart';
import 'package:find_my_apartment/Domain/model/picture_model.dart';
import 'package:find_my_apartment/Domain/model/like_state.dart';

class LikeProvider extends ChangeNotifier {
  final Map<String, LikeState> _likes = {};

  /// Full picture data keyed by id — needed for the "Liked" screen
  final Map<String, Picture> _pictures = {};

  void initialize(List<Picture> pictures) {
    for (final pic in pictures) {
      _pictures[pic.id] = pic;
      _likes.putIfAbsent(
        pic.id,
        () => LikeState(
          isLiked: pic.initialIsLiked,
          likeCount: pic.initialLikes,
        ),
      );
    }
    notifyListeners();
  }

  LikeState stateFor(String pictureId) =>
      _likes[pictureId] ?? const LikeState(isLiked: false, likeCount: 0);

  void toggleLike(String pictureId) {
    final current = _likes[pictureId] ??
        const LikeState(isLiked: false, likeCount: 0);

    _likes[pictureId] = current.copyWith(
      isLiked: !current.isLiked,
      likeCount: current.isLiked ? current.likeCount - 1 : current.likeCount + 1,
    );
    notifyListeners();
  }

  /// 👇 The list you'll use on the "Liked Pictures" route
  List<Picture> get likedPictures {
    return _likes.entries
        .where((e) => e.value.isLiked)
        .map((e) => _pictures[e.key])
        .whereType<Picture>() // drops any null
        .toList();
  }

  /// Convenience: how many are liked (for badges, etc.)
  int get likedCount => _likes.values.where((s) => s.isLiked).length;
}