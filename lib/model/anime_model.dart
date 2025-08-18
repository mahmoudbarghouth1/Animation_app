class AnimeModel {
  final String title;
  final int rank;
  final double score;
  final String synopsis;
  final String imageUrl;
  final String genres1;
  // final String genres2;
  // final String genres3;

  AnimeModel({
    required this.title,
    required this.rank,
    required this.score,
    required this.synopsis,
    required this.imageUrl,
    required this.genres1,
    // required this.genres2,
    // required this.genres3,
  });

  factory AnimeModel.fromJason(Map<String, dynamic> json) {
    return AnimeModel(
      title: json["title"],
      rank: json["rank"],
      score: json["score"],
      synopsis: json["synopsis"],
      imageUrl: json["images"]["jpg"]["image_url"],
      genres1: (json["genres"]?[0]["name"]) ?? "good",
      // genres2: (json["genres"]?[1]["name"]) ?? "",
      // genres3: (json["genres"][1]["name"]) ?? "",
    );
  }
}
