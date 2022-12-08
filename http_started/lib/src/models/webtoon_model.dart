class WebtoonModel {
  final String thumb, title, id;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : thumb = json['thumb']!,
        title = json['title']!,
        id = json['id']!;
}
