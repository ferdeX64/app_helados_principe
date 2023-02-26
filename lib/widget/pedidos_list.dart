import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui10/models/pedido_model.dart';
import 'package:ui10/widget/pedido_card.dart';
class PedidosList extends StatefulWidget {
  PedidosList({Key? key}) : super(key: key);

  @override
  State<PedidosList> createState() => _PedidosListState();
}

class _PedidosListState extends State<PedidosList> {
  final Stream<QuerySnapshot> heladosStream =
      FirebaseFirestore.instance.collection('Helado').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: heladosStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: SizedBox(child: Text('Error al consultar los helados.')),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SizedBox(
                height: 50.0, width: 50.0, child: CircularProgressIndicator()),
          );
        }
        return Container(
          margin: EdgeInsets.all(12),
          child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Pedido model =
                    Pedido.fromJson(document.data() as Map<String, dynamic>);
                return PedidoCard(model: model);
              }).toList()),
        );
      },
    );
  }
}
