import 'package:flutter/material.dart';
import 'package:ui10/core/color.dart';
import 'package:ui10/core/data.dart';
import 'package:ui10/widget/custom_app_bar.dart';
import 'dart:math' as math;

class DetailsPage extends StatefulWidget {
  final Food food;
  const DetailsPage({Key? key, required this.food}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
                    text: widget.food.name,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: brown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '\n${widget.food.withs}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: brown,
                      fontWeight: FontWeight.w400,
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
                            widget.food.kal,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 25),
                          Text(
                            'Weight:',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            widget.food.weight,
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
                        widget.food.image,
                        height: 360.0,
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
                    'Detail',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    widget.food.description,
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
                            'Total Price',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            widget.food.price,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: black,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 40.0,
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                            color: green,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40.0),
                              bottomRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0),
                            )),
                        child: Center(
                          child: Text(
                            'Try Promo code',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
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
                      Container(
                        height: 40.0,
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        decoration: BoxDecoration(
                          color: brown,
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Text(
                                'Add to Cart',
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
                              )
                            ],
                          ),
                        ),
                      ),
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
