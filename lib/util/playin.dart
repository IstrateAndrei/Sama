import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> pretendAsync() async {
  return Future.delayed(
      const Duration(seconds: 2), () => 'Sama ca tai buca ta cu lama');
}

void checkAsync(String input) async {
  print('Async completed');
}

void checkFuture(String input) {
  print('Future completed');
}

void main() async {
  print('Init Async print');
  checkAsync(await pretendAsync());

  print('Init Future print');
  pretendAsync().then((value) => checkFuture(value));
}




// adding multiple shadows
Shadow getShadow(int index) {
  return Shadow(
      offset: Offset(5.0 * index, 5.0 * index),
      blurRadius: 5 * index.toDouble(),
      color: Colors.black54);
}

List<Shadow> getShadows() {
  List<Shadow> shadows = [];
  for (var i = 0; i < 5; i++) {
    shadows.add(getShadow(i));
  }
  return shadows;
}