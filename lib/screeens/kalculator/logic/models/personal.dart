
class Personal{
   int? id;
  String? name;
  int? age;
  int? height;
  int? weight;

  Personal({
    this.id,
    this.name,
    this.age,
    this.height,
    this.weight,
  });

  Personal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    height = json['height'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['age'] = age;
    data['height'] = height;
    data['weight'] = weight;
    return data;
  }
}
