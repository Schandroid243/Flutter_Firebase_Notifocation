import 'package:json_annotation/json_annotation.dart';

import 'article_model.dart';
import 'command_model.dart';
import 'garniture_model.dart';

class CommandeArticle {
  CommandeArticle(
      {required this.article,
      required this.garnitures,
      required this.quantite,
      required this.commande});
  @JsonKey(name: 'numero_commande')
  late int article;
  late int commande;
  late final List<Garnitures> garnitures;
  late int quantite;

  factory CommandeArticle.copy({required CommandeArticle obj}) {
    return CommandeArticle(
        article: obj.article,
        garnitures: obj.garnitures,
        quantite: obj.quantite,
        commande: obj.commande);
  }

  CommandeArticle.fromJson(Map<String, dynamic> json) {
    commande = json['commande'];
    article = json['article'];
    garnitures = List.from(json['garnitures'])
        .map((e) => Garnitures.fromJson(e))
        .toList();
    quantite = json['quantite'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['commande'] = commande;
    _data['article'] = article;
    _data['garnitures'] = garnitures.map((e) => e.toJson()).toList();
    _data['quantite'] = quantite;
    return _data;
  }
}
