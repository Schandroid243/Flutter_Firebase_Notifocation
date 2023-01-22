class Data {
  Data({
    required this.key,
  });

  late final String key;

  Data.fromJson(Map<String, dynamic> json) {
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['key'] = key;
    return _data;
  }
}
