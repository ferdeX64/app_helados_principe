import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui10/models/lista_model.dart';
import 'package:ui10/models/pedido_model.dart';

import 'package:ui10/pages/ice_cream_details_page.dart';
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
    final Stream<QuerySnapshot> heladosStream =
      FirebaseFirestore.instance.collection('Lista_helados').where("nombre_lista",isEqualTo: widget.modelo.nombrePedido ).snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: heladosStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: SizedBox(child: Text('Error al consultar la lista de helados.')),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          
          return const Center(
            child: SizedBox(
                height: 50.0, width: 50.0, child: CircularProgressIndicator()),
          );
        }
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.0),
          child: ListView(
            
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                
                
                ListaHelado model =
                    ListaHelado.fromJson(document.data() as Map<String, dynamic>);
                   
                return ListaCard(model: model);
                
              }).toList()),
        );
      },
    );
  }
}
