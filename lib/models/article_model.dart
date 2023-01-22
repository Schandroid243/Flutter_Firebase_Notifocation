import 'package:json_annotation/json_annotation.dart';

import 'extra_model.dart';
import 'garniture_model.dart';

class Articles {
  Articles({
    required this.id,
    required this.categorie,
    required this.image,
    required this.nom,
    required this.description,
    required this.prix,
    required this.status,
    required this.garnitures,
    required this.extras,
  });
  late final int id;
  late final String categorie;
  late final String image;
  late final String nom;
  late final String description;
  late final String prix;
  late final bool status;
  late final List<Garnitures> garnitures;
  late final List<Extras> extras;
  late final double price = double.parse(prix);
  @JsonKey(name: 'temps_preparation')
  String? tempsPreparation;

  factory Articles.copy({required Articles obj}) {
    var garn =
        obj.garnitures.map((item) => Garnitures.copy(obj: item)).toList();

    return Articles(
      id: obj.id,
      categorie: obj.categorie,
      image: obj.image,
      nom: obj.nom,
      description: obj.description,
      prix: obj.prix,
      status: obj.status,
      garnitures: garn,
      extras: obj.extras,
      //tempsPreparation: obj.tempsPreparation,
    );
    //, extras: obj.extras
  }

  Articles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categorie = json['categorie'];
    image = json['image'];
    nom = json['nom'];
    description = json['description'];
    prix = json['prix'];
    status = json['status'];
    garnitures = List.from(json['garnitures'])
        .map((e) => Garnitures.fromJson(e))
        .toList();
    extras = List.from(json['extras']).map((e) => Extras.fromJson(e)).toList();
    tempsPreparation = json['temps_preparation'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['categorie'] = categorie;
    _data['image'] = image;
    _data['nom'] = nom;
    _data['description'] = description;
    _data['prix'] = prix;
    _data['status'] = status;
    _data['garnitures'] = garnitures.map((e) => e.toJson()).toList();
    _data['extras'] = extras.map((e) => e.toJson()).toList();
    _data['temps_preparation'] = tempsPreparation;
    return _data;
  }
}
