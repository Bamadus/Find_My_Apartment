// models/like_state.dart
class LikeState {
  final bool isLiked;
  final int likeCount;

  const LikeState({required this.isLiked, required this.likeCount});

  LikeState copyWith({bool? isLiked, int? likeCount}) {
    return LikeState(
      isLiked: isLiked ?? this.isLiked,
      likeCount: likeCount ?? this.likeCount,
    );
  }
}