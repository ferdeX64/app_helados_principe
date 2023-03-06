import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui10/core/color.dart';
import 'package:ui10/models/pedido_model.dart';
import 'package:ui10/pages/ice_cream_details_page.dart';
import 'package:ui10/pages/pedidos_page.dart';
import 'package:ui10/pages/signin_page.dart';
import 'package:ui10/widget/helados_list.dart';
import 'package:url_launcher/url_launcher.dart';

class IceCreamListPage extends StatelessWidget {
  const IceCreamListPage({Key? key, required this.model}) : super(key: key);
  final Pedido model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.all(50),
                  child: Image.asset("assets/image/man.png"),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => PedidosPage()));
                  },
                  leading: const Icon(Icons.shopping_cart_outlined),
                  title: const Text("Carrito"),
                ),
                ListTile(
                  onTap: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      print("cerrar sesión");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInPage()));
                    });
                  },
                  leading: const Icon(Icons.logout),
                  title: const Text("Cerrar Sesión"),
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
            title: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Text("Lista de helados"),
              ),
            ),
            backgroundColor: Color(0xFFCB2B93)),
        body: SingleChildScrollView(
          child: Container(
            child: SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: HeladosList(modelo: model),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFFCB2B93),
          onPressed: () async {
            //vincular con whatsapp
            String celular = '+593984415765';
            String mensaje = '${model.nombrePedido}';
            Uri _url =
                Uri.parse('whatsapp://send?phone=$celular&text=$mensaje');
            launchUrl(_url);
          },
          child: Icon(Icons.send),
        ));
  }
}
