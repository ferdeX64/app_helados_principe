import 'package:flutter/material.dart';
import 'package:ui10/core/color.dart';
import 'package:ui10/pages/ice_cream_details_page.dart';

import '../models/helado_model.dart';

class HeladoCard extends StatelessWidget {
  const HeladoCard({Key? key, required this.model}) : super(key: key);
  final Helado model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (builder) => DetailsPage(model: model)));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        margin: EdgeInsets.all(5),
        child: Container(
          margin: EdgeInsets.only(bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Image(
                        image: NetworkImage(model.heladoImage),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Text(
                  model.heladoName,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Yanone',
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
