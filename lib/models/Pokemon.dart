class Pokemon {
  String name;
  String url;
  String image;
  String hqImage;

  Pokemon({this.name, this.url, this.image, this.hqImage});

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    image = json['image'];
    hqImage = json['hqImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['image'] = this.image;
    return data;
  }
}
