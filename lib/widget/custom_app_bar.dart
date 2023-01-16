import 'package:flutter/material.dart';
import 'package:ui10/core/color.dart';

class CustomAppBar extends StatelessWidget {
  final String btnIcon1;
  final String btnIcon2;
  final Function() btnFun1;
  final Function() btnFun2;
  const CustomAppBar({
    Key? key,
    required this.btnIcon1,
    required this.btnIcon2,
    required this.btnFun1,
    required this.btnFun2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            btnFun1();
          },
          child: Container(
            height: 50.0,
            width: 50.0,
            child: Image.asset('assets/image/$btnIcon1'),
          ),
        ),
        GestureDetector(
          onTap: () => btnFun2,
          child: Container(
            height: 40.0,
            width: 45.0,
            padding: EdgeInsets.only(left: 5.0),
            decoration: BoxDecoration(
              color: brown,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
                topLeft: Radius.circular(30.0),
              ),
            ),
            child: Center(
              child: Image.asset(
                'assets/image/$btnIcon2',
                height: 45.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
