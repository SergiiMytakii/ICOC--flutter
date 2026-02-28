class InsightLikeResult {
  const InsightLikeResult({
    required this.liked,
    required this.likes,
  });

  final bool liked;
  final int likes;

  factory InsightLikeResult.fromJson(Map<String, dynamic> json) {
    return InsightLikeResult(
      liked: json['liked'] == true,
      likes: (json['likes'] as num?)?.toInt() ?? 0,
    );
  }
}
