class PostModel {
  final String itemID;
  final String title;
  final String description;
  final List<String> images;

  PostModel({required this.itemID, required this.title, required this.description, required this.images});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        itemID: json['itemID'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        images: (json['images'] as List? ?? []).map((item) => item as String).toList()
    );
  }
}