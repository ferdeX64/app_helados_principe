import 'package:flutter/material.dart';
import 'package:ui10/models/lista_model.dart';

class ListaCard extends StatelessWidget {
  const ListaCard({Key? key, required this.model}) : super(key: key);
  final ListaHelado model;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
        
        leading: SizedBox.square(dimension: 65, child: Image(image: AssetImage("assets/image/Pedido.jpg"))),
        title: Text(model.heladoName),
        subtitle: Text("Cantidad: "+model.cantidad.toString()),
        
            
            ));
}}