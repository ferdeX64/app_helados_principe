// To parse this JSON data, do
//
//     final listaHelado = listaHeladoFromJson(jsonString);

import 'dart:convert';

ListaHelado listaHeladoFromJson(String str) => ListaHelado.fromJson(json.decode(str));

String listaHeladoToJson(ListaHelado data) => json.encode(data.toJson());

class ListaHelado {
    ListaHelado({
        required this.cantidad,
        required this.heladoName,
        required this.nombreLista,
        required this.heladoImage,
    });

    int cantidad;
    String heladoName;
    String nombreLista;
    String heladoImage;

    factory ListaHelado.fromJson(Map<String, dynamic> json) => ListaHelado(
        cantidad: json["cantidad"],
        heladoName: json["helado_name"],
        nombreLista: json["nombre_lista"],
        heladoImage: json["helado_image"],
    );

    Map<String, dynamic> toJson() => {
        "cantidad": cantidad,
        "helado_name": heladoName,
        "nombre_lista": nombreLista,
        "helado_image": heladoImage,
    };
}
