class DescripcionList {
  DescripcionList({
    required this.data,
  });

  List<DescripcionModel> data;

  factory DescripcionList.fromJson(List<Map<String, dynamic>> json) => DescripcionList(
    data: json.isEmpty ? [] : List<DescripcionModel>.from(json.map((x) => DescripcionModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'data': data.isEmpty? []: List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DescripcionModel {
  DescripcionModel({
    required this.image,
    required this.title,
    required this.description,
    required this.size,
    required this.download,
    // required this.mensajes,
  });

  String image;
  String title;
  String description;
  String size;
  String download;
  // List<Mensaje> mensajes;

  factory DescripcionModel.fromJson(Map<String, dynamic> json) => DescripcionModel(
    image: json['image'].toString(),
    title: json['title'],
    description: json['description'],
    size: json['size'],
    download: json['download']
    // mensajes: List<Mensaje>.from(json['mensajes'].map((x) => Mensaje.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'image': image,
    'title': title,
    'description': description,
    'size': size,
    'download': download
    // 'mensajes': List<dynamic>.from(mensajes.map((x) => x.toJson())),
  };
}