import 'dart:ffi' as ffi;
import 'dart:math';

import 'package:ffi/ffi.dart';
import 'package:flutter/material.dart';
import 'package:test_04/selection_sort_ffi.dart';

class SortingVisualizer extends StatefulWidget {
  final List<int> array;

  const SortingVisualizer({required this.array});

  @override
  _SortingVisualizerState createState() => _SortingVisualizerState();
}

class _SortingVisualizerState extends State<SortingVisualizer> {
  late List<int> array;
  late List<SortStep> steps;
  int comparisons = 0;
  int accesses = 0;

  Set<int> comparing = {};
  Set<int> sortedIndices = {}; // Các cột đã đúng vị trí (màu xanh)
  int? currentMinIndex;

  @override
  void initState() {
    super.initState();
    array = List.from(widget.array);
    runSorting();
  }

  void runSorting() async {
    final ptr = malloc<ffi.Int32>(array.length);
    for (int i = 0; i < array.length; i++) {
      ptr[i] = array[i];
    }

    selectionSort(ptr, array.length);

    final stepCountPtr = malloc<ffi.Int32>();
    final stepPtr = getSteps(stepCountPtr);
    final totalSteps = stepCountPtr.value;

    steps = List.generate(totalSteps, (i) => stepPtr.elementAt(i).ref);
    malloc.free(stepCountPtr);
    malloc.free(ptr);

    for (final step in steps) {
      setState(() {
        comparing.clear();

        final t = StepType.values[step.type];
        switch (t) {
          case StepType.compare:
            comparisons++;
            accesses += 2;
            comparing.add(step.index1);
            comparing.add(step.index2);

            // Nếu tìm thấy phần tử nhỏ hơn, thì cột nhỏ nhất mới là màu xanh
            if (currentMinIndex == null || array[step.index2] < array[currentMinIndex!]) {
              currentMinIndex = step.index2;
            }
            break;

          case StepType.swap:
            accesses += 4;
            // Hoán đổi
            final tmp = array[step.index1];
            array[step.index1] = array[step.index2];
            array[step.index2] = tmp;

            // Cột đúng vị trí sau swap được tô xanh
            sortedIndices.clear();
            sortedIndices.add(step.index1);

            // Reset currentMinIndex sang null để chuẩn bị cho vòng tiếp theo
            currentMinIndex = null;
            break;

          default:
            break;
        }
      });

      await Future.delayed(Duration(milliseconds: 50));
    }

    // Sau khi hoàn thành, tô xanh tất cả
    setState(() {
      sortedIndices.clear();
      for (int i = 0; i < array.length; i++) {
        sortedIndices.add(i);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomPaint(
        painter: ArrayPainter(
          array: array,
          comparing: comparing,
          sortedIndices: sortedIndices,
          comparisons: comparisons,
          accesses: accesses,
        ),
        child: Container(),
      ),
    );
  }
}

class ArrayPainter extends CustomPainter {
  final List<int> array;
  final Set<int> comparing;
  final Set<int> sortedIndices;
  final int comparisons;
  final int accesses;

  ArrayPainter({
    required this.array,
    required this.comparing,
    required this.sortedIndices,
    required this.comparisons,
    required this.accesses,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()..color = Colors.black;
    canvas.drawRect(Offset.zero & size, backgroundPaint);

    const double textPadding = 40;
    final textSpan = TextSpan(
      text: 'Selection Sort - Comparisons: $comparisons, Array accesses: $accesses',
      style: TextStyle(color: Colors.white, fontSize: 14),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(10, textPadding));

    final barsMaxHeight = size.height - textPainter.height - textPadding * 2;

    final barWidth = size.width / array.length;
    final maxVal = array.reduce(max);

    final barPaint = Paint()..style = PaintingStyle.fill;
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    for (int i = 0; i < array.length; i++) {
      if (sortedIndices.contains(i)) {
        barPaint.color = Colors.green;
      } else if (comparing.contains(i)) {
        barPaint.color = Colors.red;
      } else {
        barPaint.color = Colors.white;
      }

      final barHeight = (array[i] / maxVal) * barsMaxHeight;
      final left = i * barWidth;
      final top = size.height - barHeight;

      final rect = Rect.fromLTWH(left, top, barWidth * 0.9, barHeight);

      canvas.drawRect(rect, barPaint);
      canvas.drawRect(rect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
