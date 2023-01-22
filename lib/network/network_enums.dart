enum NetworkResponseErrorType {
  socket,
  exception,
  responseEmpty,
  didNotSucceed
}

enum CallBackParameterName {
  all,
  clients,
}

extension CallbackParameterNameExtention on CallBackParameterName {
  dynamic getJson(json) {
    if (json == null) return null;
    switch (this) {
      case CallBackParameterName.all:
        return json;
      case CallBackParameterName.clients:
        return json['profiles'];
    }
  }
}
