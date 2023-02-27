import 'dart:convert';

Helado heladoFromJson(String str) => Helado.fromJson(json.decode(str));

String heladoToJson(Helado data) => json.encode(data.toJson());

class Helado {
    Helado({
        required this.heladoDescription,
        required this.heladoName,
        required this.heladoPrice,
        required this.id,
        required this.heladoImage
    });

    String heladoDescription;
    String heladoName;
    String heladoImage;
    int heladoPrice;
    int id;

    factory Helado.fromJson(Map<String, dynamic> json) => Helado(
        heladoDescription: json["helado_description"],
        heladoName: json["helado_name"],
        heladoPrice: json["helado_price"],
        id: json["id"],
        heladoImage:json["helado_image"]
    );

    Map<String, dynamic> toJson() => {
        "helado_description": heladoDescription,
        "helado_name": heladoName,
        "helado_price": heladoPrice,
        "id": id,
        "helado_image":heladoImage
    };
}
