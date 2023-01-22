import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'article_model.dart';

Commande commandeModelFromJson(String str) =>
    Commande.fromJson(json.decode(str));
String commandeModelToJsn(Commande data) => json.encode(data.toJson());

class Commande {
  Commande(
      {required this.client,
      required this.kiosk,
      required this.numeroCommande,
      required this.articles,
      required this.id,
      String? commandEtat,
      String? telephone,
      String? commandeType,
      String? modePaiement,
      String? nomClient});
  late final int id;
  late final int client;
  late final int kiosk;
  @JsonKey(name: 'commande_etat')
  String? commandEtat;
  @JsonKey(name: 'numero_commande')
  late final String numeroCommande;
  late final List<Articles> articles;
  String? telephone;
  @JsonKey(name: 'commande_type')
  String? commandeType;
  @JsonKey(name: 'mode_paiement')
  String? modePaiement;
  String? nomClient;

  Commande.fromJson(Map<String, dynamic> json) {
    client = json['client'];
    kiosk = json['kiosk'];
    numeroCommande = json['numero_commande'];
    commandEtat = json['commande_etat'];
    nomClient = json['nomClient'];
    articles =
        List.from(json['articles']).map((e) => Articles.fromJson(e)).toList();
    id = json['id'];
    telephone = json['telephone'];
    commandeType = json['commande_type'];
    modePaiement = json['mode_paiement'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['client'] = client;
    _data['kiosk'] = kiosk;
    _data['numero_commande'] = numeroCommande;
    _data['commande_etat'] = commandEtat;
    _data['articles'] = articles.map((e) => e.toJson()).toList();
    _data['telephone'] = telephone;
    _data['id'] = id;
    _data['commande_type'] = commandeType;
    _data['mode_paiement'] = modePaiement;
    _data['nomClient'] = nomClient;
    return _data;
  }
}
