import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_04/widget_sort.dart';

void main() {
  // Ẩn status bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // Tạo list không lặp lại
  final uniqueArray = List.generate(100, (i) => i + 1)..shuffle();

  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SortingVisualizer(array: uniqueArray.take(80).toList()),
      ),
    ),
  ));
}
