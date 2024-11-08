class Categury {
  int? id;
  String? name;
  String? image;
  String? type;

  Categury({
    this.id,
    this.name,
    this.image,
    this.type,
  });

  Categury.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    type = json['type'];
    //isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['type'] = this.type;
    // data['isActive'] = this.isActive;
    return data;
  }
}
 