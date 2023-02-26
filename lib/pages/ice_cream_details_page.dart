import 'package:cart_stepper/cart_stepper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ui10/core/color.dart';
import 'package:ui10/models/helado_model.dart';
import 'package:ui10/widget/custom_app_bar.dart';
import 'dart:math' as math;

var now = new DateTime.now();
var formatter = new DateFormat('yyyy-MM-dd');
String nombre = "Pedido " + formatter.format(now);

class DetailsPage extends StatefulWidget {
  final Helado model;
  const DetailsPage({Key? key, required this.model}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  TextEditingController heladoController = TextEditingController(text: "");
  int _counterInit = 1;
  bool click=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomAppBar(
                btnIcon1: 'arrow.png',
                btnIcon2: 'more.png',
                btnFun1: () {
                  Navigator.pop(context);
                },
                btnFun2: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: widget.model.heladoName,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: brown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(height: 30.0),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 30.0,
                      ),
                      height: 180.0,
                      decoration: BoxDecoration(
                        color: brown,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kkal:',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "2",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 25),
                          Text(
                            'Peso:',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "3",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 10,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: Image.asset(
                        "assets/image/helado01.png",
                        height: 300.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 25.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ingredientes',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    widget.model.heladoDescription,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Precio por Unidad',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            widget.model.heladoPrice.toString(),
                            style: TextStyle(
                              fontSize: 16.0,
                              color: black,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Precio por Docena',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            "5",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: black,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 50.0,
                            padding: EdgeInsets.symmetric(horizontal: 1.0),
                            decoration: BoxDecoration(
                                color: green,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40.0),
                                  bottomRight: Radius.circular(40.0),
                                  topLeft: Radius.circular(40.0),
                                )),
                            child: Center(
                              child: CartStepperInt(
                                style: CartStepperStyle.fromColorScheme(
                                    ColorScheme.light(primary: green),
                                    textStyle: TextStyle(color: Colors.white)),
                                elevation: 7,
                                value: _counterInit,
                                didChangeCount: (count) {
                                  setState(() {
                                    _counterInit = count;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          color: brown,
                          size: 30.0,
                        ),
                      ),
                      InkWell(
                          child: Container(
                            height: 40.0,
                            padding: EdgeInsets.symmetric(horizontal: 30.0),
                            decoration: BoxDecoration(
                              color: click? brown:Colors.green,
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Text(click?
                                    'Añadir ':'Comprado',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    color: white,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: (){                          
                            setState(() {
                              click=!click;
                            
                            });
                            if(click==false){
                                sendHeladoToList(widget.model.heladoName, _counterInit);
                            }
                          }),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}

sendHeladoToList( String heladoName, int cantidad) async {
  List pedido = [];
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('Pedido')
      .where("nombre_pedido", isEqualTo: nombre)
      .get();
  for (var doc in querySnapshot.docs) {
    pedido.add(doc.data());
  }
  if (pedido.isEmpty) {
    createPedido(nombre);
    createHeladoToList(heladoName, cantidad);
    
  } else {
    createHeladoToList(heladoName, cantidad);
  }

}
createHeladoToList(String heladoName, int cantidad)async{
  await FirebaseFirestore.instance.collection('Lista_helados').add({
      "helado_name": heladoName,
      "cantidad": cantidad,
      "nombre_lista": nombre
    });
}

createPedido(String nombreLista) async {
  await FirebaseFirestore.instance.collection('Pedido').add({
    "nombre_pedido": nombre,
  });
}
