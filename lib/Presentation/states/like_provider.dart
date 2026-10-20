// providers/like_provider.dart
import 'package:flutter/foundation.dart';
import 'package:find_my_apartment/Domain/model/picture_model.dart';
import 'package:find_my_apartment/Domain/model/like_state.dart';

/// What kind of media this like belongs to.
enum LikeType { cat_pictures, other_pictures }

class LikeProvider extends ChangeNotifier {
  /// Keyed by "<type>:<id>" — e.g. "picture:42", "video:99"
  final Map<String, LikeState> _likes = {};

  /// Full data keyed by "<type>:<id>" so we can rebuild the "Liked" screens.
  final Map<String, dynamic> _items = {};

  // ─────────────────────────────────────────────────────────────
  // Key helper
  // ─────────────────────────────────────────────────────────────
  String _key(LikeType type, String id) => '${type.name}:$id';

  // ─────────────────────────────────────────────────────────────
  // Initialization
  // ─────────────────────────────────────────────────────────────
  void initializePictures(List<Picture> catPic) {
    for (final pic in catPic) {
      final k = _key(LikeType.cat_pictures, pic.id);
      _items[k] = pic;
      _likes.putIfAbsent(
        k,
        () => LikeState(
          isLiked: pic.initialIsLiked,
          likeCount: pic.initialLikes,
        ),
      );
    }
    notifyListeners();
  }

  void initializeOtherPictures(List<Picture> otherPic) {
    for (final other_pic in otherPic) {
      final k = _key(LikeType.other_pictures, other_pic.id);
      _items[k] = other_pic;
      _likes.putIfAbsent(
        k,
        () => LikeState(
          isLiked: other_pic.initialIsLiked,
          likeCount: other_pic.initialLikes,
        ),
      );
    }
    notifyListeners();
  }

  // ─────────────────────────────────────────────────────────────
  // State lookup
  // ─────────────────────────────────────────────────────────────
  LikeState stateFor(LikeType type, String id) {
    return _likes[_key(type, id)] ??
        const LikeState(isLiked: false, likeCount: 0);
  }

  // ─────────────────────────────────────────────────────────────
  // Toggle
  // ─────────────────────────────────────────────────────────────
  void toggleLike(LikeType type, String id) {
    final k = _key(type, id);
    final current =
        _likes[k] ?? const LikeState(isLiked: false, likeCount: 0);

    _likes[k] = current.copyWith(
      isLiked: !current.isLiked,
      likeCount: current.isLiked
          ? current.likeCount - 1
          : current.likeCount + 1,
    );
    notifyListeners();
  }

  // ─────────────────────────────────────────────────────────────
  // Liked lists (for "Liked Pictures" / "Liked Videos" screens)
  // ─────────────────────────────────────────────────────────────

//   List<Picture> get allLikedPictures {
//   return _likes.entries
//       .where((entry) => entry.value.isLiked)
//       .map((entry) => _items[entry.key])
//       .whereType<Picture>()
//       .toList();
// }

List<Picture> get liked_Cat_Pictures {
  final Map<String, Picture> uniquePictures = {};

  for (final entry in _likes.entries) {
    if (!entry.value.isLiked) continue;
    
    if (!entry.key.startsWith(
      '${LikeType.cat_pictures.name}:',
    )) {
      continue;
    }

    final picture = _items[entry.key];

    if (picture is Picture) {
      uniquePictures.putIfAbsent(
        picture.id,
        () => picture,
      );
    }
  }

  return uniquePictures.values.toList();
}

  // List<Picture> get liked_Other_Pictures {
  //   return _likes.entries
  //       .where((e) =>
  //           e.value.isLiked && e.key.startsWith('${LikeType.other_pictures.name}:'))
  //       .map((e) => _items[e.key])
  //       .whereType<Picture>()
  //       .toList();
  // }

  // ─────────────────────────────────────────────────────────────
  // Convenience counts
  // ─────────────────────────────────────────────────────────────
  int get liked_cat_picCount => _likes.entries
      .where((e) =>
          e.value.isLiked && e.key.startsWith('${LikeType.cat_pictures.name}:'))
      .length;

  int get liked_other_pic_Count => _likes.entries
      .where((e) =>
          e.value.isLiked && e.key.startsWith('${LikeType.other_pictures.name}:'))
      .length;
}