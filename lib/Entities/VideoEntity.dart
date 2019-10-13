class VideoEntity {
  final int id;
  final String name;
  final String link;
  final String imageUrl;
  final int numberOfViews;

  VideoEntity({this.id, this.name, this.link, this.imageUrl, this.numberOfViews});

  factory VideoEntity.fromJson(Map<String, dynamic> json) {
    return VideoEntity(
      id: json['id'],
      name: json['name'],
      link: json['link'],
      imageUrl: json['imageUrl'],
      numberOfViews: json['numberOfViews'],
    );
  }
}