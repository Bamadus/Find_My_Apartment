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

  Picture({
    required this.id,
    required this.path,
    required this.title,
    required this.price,
    required this.location,
    this.initialLikes = 0,
    this.initialIsLiked = false,
    this.isAsset = true,
  });
}