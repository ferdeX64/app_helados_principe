import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui10/core/color.dart';
import 'package:ui10/core/data.dart';
import 'package:ui10/pages/all_ice_creams.dart';
import 'package:ui10/pages/signin_page.dart';

class IceCreamPage extends StatelessWidget {
  const IceCreamPage({Key? key, required this.categories}) : super(key: key);
  final Categories categories;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Text(categories.name),
            ),
          ),
          backgroundColor: Color(0xFFCB2B93)),
      body: SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: AllIceCream(),
            ),
          ),
        ),
      ),
    );
  }
}
