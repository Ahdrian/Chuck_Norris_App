class ChuckJoke {
  List<String> categories;
  DateTime createdAt;
  String iconUrl;
  String id;
  DateTime updatedAt;
  String url;
  String jokeText;

  ChuckJoke(
      {this.categories,
        this.createdAt,
        this.iconUrl,
        this.id,
        this.updatedAt,
        this.url,
        this.jokeText});

  ChuckJoke.fromJson(Map<String, dynamic> json) {
    categories = json['categories'].cast<String>();
    createdAt = DateTime.parse(json['created_at']);
    iconUrl = json['icon_url'];
    id = json['id'];
    updatedAt = DateTime.parse(json['updated_at']);
    url = json['url'];
    jokeText = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories'] = this.categories;
    data['created_at'] = this.createdAt;
    data['icon_url'] = this.iconUrl;
    data['id'] = this.id;
    data['updated_at'] = this.updatedAt;
    data['url'] = this.url;
    data['value'] = this.jokeText;
    return data;
  }
}