class Video {
  final String key;
  final String site;
  final String type;

  Video({required this.key, required this.site, required this.type});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      key: json['key'],
      site: json['site'],
      type: json['type'],
    );
  }
}
