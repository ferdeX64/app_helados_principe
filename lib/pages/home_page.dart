import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui10/core/color.dart';
import 'package:ui10/core/data.dart';
import 'package:ui10/pages/details_page.dart';
import 'package:ui10/pages/signin_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectIndex = 0;
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
      appBar: AppBar(backgroundColor: Color(0xFFCB2B93)),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CustomAppBar(
                  //   btnIcon1: 'menu.png',
                  //   btnFun1: () {},
                  //   btnIcon2: 'search.png',
                  //   btnFun2: () {},
                  // ),
                  SizedBox(height: 20.0),
                  Text(
                    'Hola!',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    '¿Quieres ordenar deliciosos helados?',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categorias',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'ver más',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    height: 250.0,
                    child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: categories.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 2,
                          childAspectRatio: 1.5,
                        ),
                        itemBuilder: (itemBuilder, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() => selectIndex = index);
                            },
                            child: Container(
                              height: 50.0,
                              margin:
                                  EdgeInsets.only(bottom: 10.0, right: 10.0),
                              decoration: BoxDecoration(
                                color: selectIndex == index ? green : gray,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    categories[index].image,
                                    height: 30.0,
                                    width: 30.0,
                                    color: selectIndex == index ? white : black,
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    categories[index].name,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color:
                                          selectIndex == index ? white : black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    'Variedad en Sabores',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 25.0, left: 20.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: foods.length,
                  itemBuilder: (itemBuilder, index) {
                    final food = foods[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => DetailsPage(food: food)));
                      },
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 130.0,
                              width: 185.0,
                              margin: EdgeInsets.only(right: 10.0),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 15.0,
                              ),
                              decoration: BoxDecoration(
                                color: index % 2 == 0 ? brown : gray,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    food.title,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: index % 2 == 0 ? white : black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    food.priceperunit,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: index % 2 == 0 ? white : black,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Image.asset(
                            food.image,
                            height: 150.0,
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
