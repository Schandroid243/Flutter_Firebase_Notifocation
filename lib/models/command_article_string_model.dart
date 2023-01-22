import 'package:json_annotation/json_annotation.dart';

import 'article_model.dart';
import 'command_model.dart';
import 'garniture_model.dart';

class CommandeArticleString {
  CommandeArticleString(
      {required this.articles,
      required this.garnitures,
      required this.quantite,
      required this.commande});
  @JsonKey(name: 'numero_commande')
  late final Articles articles;
  late int commande;
  late final List<Garnitures> garnitures;
  late int quantite;

  factory CommandeArticleString.copy({required CommandeArticleString obj}) {
    return CommandeArticleString(
        articles: obj.articles,
        garnitures: obj.garnitures,
        quantite: obj.quantite,
        commande: obj.commande);
  }

  CommandeArticleString.fromJson(Map<String, dynamic> json) {
    commande = json['commande'];
    articles = Articles.fromJson(json['article']);
    garnitures = List.from(json['garnitures'])
        .map((e) => Garnitures.fromJson(e))
        .toList();
    quantite = json['quantite'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['commande'] = commande;
    _data['articles'] = articles;
    _data['garnitures'] = garnitures.map((e) => e.toJson()).toList();
    _data['quantite'] = quantite;
    return _data;
  }
}
