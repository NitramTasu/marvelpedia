class Character{
  int id;
  String name;
  String description;
  String urlImage;

  Character({this.id, this.name, this.description, this.urlImage});

  Character.fromJson(Map<String, dynamic> json)
  : id = json['id'],
    name = json['name'],
    description = json['description'],
    urlImage = json['urlImage'];

  Map<String, dynamic> toJson() => 
  {
    'id' : id,
    'name' : name,
    'description' : description,
    'urlImage' : urlImage,
  };
}