
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui10/core/color.dart';
import 'package:ui10/core/data.dart';
import 'package:ui10/pages/all_ice_creams.dart';
import 'package:ui10/pages/pedidos_page.dart';
import 'package:ui10/pages/signin_page.dart';

class IceCreamPage extends StatelessWidget {
  const IceCreamPage({Key? key, required this.categories}) : super(key: key);
  final Categories categories;
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignInPage()));
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
        title:  Center( 
        child:Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Text(categories.name),
        ),) ,
        backgroundColor: Color.fromRGBO(203, 43, 147, 1)),
      body: SingleChildScrollView(
        child: Container(

          height: MediaQuery.of(context).size.height-39,
          child: SafeArea(
            child: Container(
                  
                  child: AllIceCream(),
                ),
          ),
        ),
      ),
    );
  }
}

  