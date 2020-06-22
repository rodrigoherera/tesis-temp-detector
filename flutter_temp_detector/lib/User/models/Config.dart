class ConfigModel {
  int id;
  String grpc;
  int grpcport;
  String ws;
  int wsport;

  ConfigModel({
    this.id,
    this.grpc,
    this.grpcport,
    this.ws,
    this.wsport,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'grpc': grpc,
      'grpcport': grpcport,
      'ws': ws,
      'wsport': wsport,
    };
    return map;
  }

  static ConfigModel fromMap(Map<String, dynamic> map) {
    return ConfigModel(
      id: map['id'],
      grpc: map['grpc'],
      grpcport: map['grpcport'],
      ws: map['ws'],
      wsport: map['wsport'],
    );
  }
}
