import 'package:find_my_apartment/Domain/model/picture_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';


class PropertyProvider extends ChangeNotifier {
  final Box<dynamic> _box;

  PropertyProvider(this._box);

  List<Picture> get properties {
    return _box.values.map((value) {
      return Picture.fromMap(
        value as Map<dynamic, dynamic>,
      );
    }).toList();
  }

  Picture? getPropertyById(String id) {
    final data = _box.get(id);

    if (data == null) return null;

    return Picture.fromMap(
      data as Map<dynamic, dynamic>,
    );
  }

  Future<void> saveProperty(Picture property) async {
    await _box.put(property.id, property.toMap());
    notifyListeners();
  }

  Future<void> toggleLike(String id) async {
    final property = getPropertyById(id);

    if (property == null) return;

    final updatedProperty = property.copyWith(
      initialIsLiked: !property.initialIsLiked,
    );

    await saveProperty(updatedProperty);
  }

  List<Picture> get likedProperties {
    return properties.where((p) => p.initialIsLiked).toList();
  }
}