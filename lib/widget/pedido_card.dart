import 'package:flutter/material.dart';
import 'package:ui10/models/pedido_model.dart';
import 'package:ui10/pages/ice_cream_list_page.dart';

class PedidoCard extends StatelessWidget {
  const PedidoCard({Key? key, required this.model}) : super(key: key);
  final Pedido model;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      onTap: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => IceCreamListPage(model: model),
          ),
        );
      },
      leading: SizedBox.square(
          dimension: 65,
          child: Image(image: AssetImage("assets/image/Pedido.jpg"))),
      title: Text(model.nombrePedido),
      subtitle: Text("Toca para ver la lista de helados."),
    ));
  }
}
