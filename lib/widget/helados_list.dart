import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ui10/models/lista_model.dart';
import 'package:ui10/models/pedido_model.dart';
import 'package:ui10/widget/lista_card.dart';

class HeladosList extends StatefulWidget {
  HeladosList({Key? key, required this.modelo}) : super(key: key);
  final Pedido modelo;
  @override
  State<HeladosList> createState() => _HeladosListState();
}

class _HeladosListState extends State<HeladosList> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> heladosStream = FirebaseFirestore.instance
        .collection('Lista_helados')
        .where("nombre_lista", isEqualTo: widget.modelo.nombrePedido)
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: heladosStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: SizedBox(
                child: Text('Error al consultar la lista de helados.')),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SizedBox(
                height: 50.0, width: 50.0, child: CircularProgressIndicator()),
          );
        }
        return Container(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.0),
            child: ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
              ListaHelado model =
                  ListaHelado.fromJson(document.data() as Map<String, dynamic>);

              return Slidable(
                  key: const ValueKey(0),

                  // The start action pane is the one at the left or the top side.
                  startActionPane: ActionPane(
                    extentRatio: 0.3,
                    // A motion is a widget used to control how the pane animates.
                    motion: const StretchMotion(),
                    dismissible: DismissiblePane(onDismissed: () {}),

                    // A pane can dismiss the Slidable.

                    // All actions are defined in the children parameter.
                    children: [
                      // A SlidableAction can have an icon and/or a label.
                      SlidableAction(
                        onPressed: doNothing,
                        backgroundColor: Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Eliminar',
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ],
                  ),
                  child: ListaCard(model: model));
            }).toList()));
      },
    );
  }
}

void doNothing(BuildContext context) {}
