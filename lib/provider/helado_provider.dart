import 'package:flutter/material.dart';
import 'package:ui10/core/data.dart';

class HeladoProvider extends ChangeNotifier {
  List<Food> helados = [];
  List<Food> heladoCartShop = [];
  double total = 0;
  //agregar a a lista de Food
  addHelado(Food food) {
    helados.add(food);
  }

  addHelados(List<Food> food) {
    helados = food;
  }

  //Borrar helado
  deleteHelado(Food food) {
    heladoCartShop.remove(food);
  }

  //Agregar al carrito
  addHeladoShop(Food food) {
    heladoCartShop.add(food);
  }

  //Generar subtotal
  generateTotal() {
    total = heladoCartShop.length * 190;
  }
}
