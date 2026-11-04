// models/picture.dart

class Picture {
  final String id;
  final String path;
  final String title;
  final String price;
  final String location;
  final int initialLikes;
  final bool initialIsLiked;
  final bool isAsset;

  const Picture({
    required this.id,
    required this.path,
    required this.title,
    required this.price,
    required this.location,
    this.initialLikes = 0,
    this.initialIsLiked = false,
    this.isAsset = true,
  });

  // Create an updated copy of a property
  Picture copyWith({
    String? id,
    String? path,
    String? title,
    String? price,
    String? location,
    int? initialLikes,
    bool? initialIsLiked,
    bool? isAsset,
  }) {
    return Picture(
      id: id ?? this.id,
      path: path ?? this.path,
      title: title ?? this.title,
      price: price ?? this.price,
      location: location ?? this.location,
      initialLikes: initialLikes ?? this.initialLikes,
      initialIsLiked: initialIsLiked ?? this.initialIsLiked,
      isAsset: isAsset ?? this.isAsset,
    );
  }

  // Convert Picture into a Map for Hive
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'path': path,
      'title': title,
      'price': price,
      'location': location,
      'initialLikes': initialLikes,
      'initialIsLiked': initialIsLiked,
      'isAsset': isAsset,
    };
  }

  // Convert Hive Map back into Picture
  factory Picture.fromMap(Map<dynamic, dynamic> map) {
    return Picture(
      id: map['id'] as String,
      path: map['path'] as String,
      title: map['title'] as String,
      price: map['price'] as String,
      location: map['location'] as String,
      initialLikes: map['initialLikes'] as int? ?? 0,
      initialIsLiked: map['initialIsLiked'] as bool? ?? false,
      isAsset: map['isAsset'] as bool? ?? true,
    );
  }
}