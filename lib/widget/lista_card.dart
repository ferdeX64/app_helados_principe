import 'package:flutter/material.dart';
import 'package:ui10/models/lista_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ListaCard extends StatelessWidget {
  const ListaCard({Key? key, required this.model}) : super(key: key);
  final ListaHelado model;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: SizedBox.square(
          dimension: 65,
          child: Image(image: NetworkImage(model.heladoImage, scale: 0.1))),
      title: Text(model.heladoName),
      subtitle: Text("Cantidad: " + model.cantidad.toString()),
      onLongPress: () async {
        String celular = '+593984415765';
        String mensaje =
            'Helado: ${model.heladoName} Cantidad: ${model.cantidad} \nTotal: ${model.cantidad * 0.50} \$';
        Uri _url = Uri.parse('whatsapp://send?phone=$celular&text=$mensaje');
        launchUrl(_url);
      },
    ));
  }
}
