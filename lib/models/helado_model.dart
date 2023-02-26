import 'dart:convert';

Helado heladoFromJson(String str) => Helado.fromJson(json.decode(str));

String heladoToJson(Helado data) => json.encode(data.toJson());

class Helado {
    Helado({
        required this.heladoDescription,
        required this.heladoName,
        required this.heladoPrice,
        required this.id,
    });

    String heladoDescription;
    String heladoName;
    int heladoPrice;
    int id;

    factory Helado.fromJson(Map<String, dynamic> json) => Helado(
        heladoDescription: json["helado_description"],
        heladoName: json["helado_name"],
        heladoPrice: json["helado_price"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "helado_description": heladoDescription,
        "helado_name": heladoName,
        "helado_price": heladoPrice,
        "id": id,
    };
}
