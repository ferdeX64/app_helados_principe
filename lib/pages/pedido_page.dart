import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PedidoPage extends StatefulWidget {
  const PedidoPage({Key? key}) : super(key: key);

  @override
  State<PedidoPage> createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedido"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          FloatingActionButton(
            onPressed: () async {
              //vincular con whatsapp
              String celular = '+593998667053';
              String mensaje = 'probando la vinculación a whatsapp';
              Uri _url =
                  Uri.parse('whatsapp://send?phone=$celular&text=$mensaje');
              launchUrl(_url);
            },
            child: Icon(Icons.send),
          )
        ],
      )),
    );
  }
}
