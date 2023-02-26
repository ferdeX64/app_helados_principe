import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PedidoPage extends StatefulWidget {
  const PedidoPage({Key? key}) : super(key: key);

  @override
  State<PedidoPage> createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  final List<Helado> _helados = [
    Helado("Helado de leche con mora, naranjilla y taxo", 0.50,
        "assets/image/helado01.png"),
    Helado("Helado de chocolate y menta", 0.50, "assets/image/helado03.png")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pedido"),
        backgroundColor: Color(0xFFCB2B93),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _helados.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.all(10),
                    elevation: 10,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(_helados[index].name),
                          subtitle: Text(
                            '\$./ ' +
                                _helados[index].precio.toString() +
                                ' x ' +
                                '1',
                            textAlign: TextAlign.center,
                          ),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(_helados[index].image),
                            radius: 20,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FlatButton(
                                onPressed: () => {}, child: Icon(Icons.add)),
                            Text("1"),
                            FlatButton(
                                onPressed: () => {}, child: Icon(Icons.remove))
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Subtotal"), Text("\$./ 0.88")],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Impuesto"), Text("\$./ 0.12")],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Total"), Text("\$./ 1.00")],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFCB2B93),
        onPressed: () async {
          //vincular con whatsapp
          String celular = '+593984415765';
          String mensaje = 'probando la vinculación a whatsapp';
          Uri _url = Uri.parse('whatsapp://send?phone=$celular&text=$mensaje');
          launchUrl(_url);
        },
        child: Icon(Icons.send),
      ),
    );
  }
}

class Helado {
  String name;
  double precio;
  String image;
  Helado(this.name, this.precio, this.image);
}
