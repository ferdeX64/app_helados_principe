// To parse this JSON data, do
//
//     final pedido = pedidoFromJson(jsonString);

import 'dart:convert';

Pedido pedidoFromJson(String str) => Pedido.fromJson(json.decode(str));

String pedidoToJson(Pedido data) => json.encode(data.toJson());

class Pedido {
    Pedido({
        required this.nombrePedido,
    });

    String nombrePedido;

    factory Pedido.fromJson(Map<String, dynamic> json) => Pedido(
        nombrePedido: json["nombre_pedido"],
    );

    Map<String, dynamic> toJson() => {
        "nombre_pedido": nombrePedido,
    };
}
