class PostModel {
  final String? content, status, time, favoritesNumber;
  final int? postId, userId;
  final List? images;

  PostModel({
    required this.userId,
    required this.content,
    required this.images,
    this.postId,
    this.status,
    this.time,
    this.favoritesNumber,
  });

  factory PostModel.fromJson({required Map json}) {
    return PostModel(
      userId: json["user_id"],
      postId: json["post_id"],
      content: json["content"],
      status: json["status"],
      time: json["time"],
      favoritesNumber: json["favorites_number"],
      images: json["images"],
    );
  }

  toMap() {
    final jsonMap = {
      "user_id": userId,
      "content": content,
      "images": images,
      "status": status ?? "not adopted",
      "time": time ?? DateTime.now().toIso8601String(),
      "favorites_number": favoritesNumber ?? 0,
    };

    if (postId == null) {
      return jsonMap;
    }

    return {"post_id": postId, ...jsonMap};
  }
}
