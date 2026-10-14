
import 'package:flutter/foundation.dart';

class LikeModel extends ChangeNotifier {
  // Key format: "picture:<id>" or "video:<id>"
  final Set<String> _likedKeys = {};

  bool isLiked(String type, String id) {
    return _likedKeys.contains('$type:$id');
  }

  void toggle(String type, String id) {
    final key = '$type:$id';
    if (_likedKeys.contains(key)) {
      _likedKeys.remove(key);
    } else {
      _likedKeys.add(key);
    }
    notifyListeners();
  }
}