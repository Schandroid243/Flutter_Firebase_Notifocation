class Garnitures {
  Garnitures({
    required this.id,
    required this.image,
    required this.nom,
    required this.status,
    required this.type,
    required this.parent,
  });
  late final int id;
  late final String image;
  late final String nom;
  late final bool status;
  late final String type;
  int? parent;

  factory Garnitures.copy({required Garnitures obj}) {
    return Garnitures(
        id: obj.id,
        image: obj.image,
        nom: obj.nom,
        status: obj.status,
        type: obj.type,
        parent: obj.parent);
  }

  Garnitures.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    nom = json['nom'];
    status = json['status'];
    type = json['type'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['image'] = image;
    _data['nom'] = nom;
    _data['status'] = status;
    _data['type'] = type;
    _data['parent'] = parent;
    return _data;
  }
}
