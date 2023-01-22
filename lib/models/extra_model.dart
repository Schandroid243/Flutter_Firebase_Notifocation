class Extras {
  Extras({
    required this.id,
    required this.image,
    required this.nom,
    required this.description,
    required this.prix,
    required this.status,
  });
  late final int id;
  late final String image;
  late final String nom;
  late final String description;
  late final double prix;
  late final bool status;

  Extras.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    nom = json['nom'];
    description = json['description'];
    prix = json['prix'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['image'] = image;
    _data['nom'] = nom;
    _data['description'] = description;
    _data['prix'] = prix;
    _data['status'] = status;
    return _data;
  }
}
