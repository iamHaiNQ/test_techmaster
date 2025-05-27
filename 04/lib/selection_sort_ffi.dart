import 'dart:ffi' as ffi;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ffi/ffi.dart';

enum StepType {
  compare,
  access,
  swap,
}

base class SortStep extends ffi.Struct {
  @ffi.Int32()
  external int type;

  @ffi.Int32()
  external int index1;

  @ffi.Int32()
  external int index2;
}

final dylib = ffi.DynamicLibrary.open("libselection_sort.so");

final selectionSort = dylib
    .lookupFunction<ffi.Void Function(ffi.Pointer<ffi.Int32>, ffi.Int32), void Function(ffi.Pointer<ffi.Int32>, int)>("selection_sort");

final getSteps = dylib
    .lookupFunction<ffi.Pointer<SortStep> Function(ffi.Pointer<ffi.Int32>), ffi.Pointer<SortStep> Function(ffi.Pointer<ffi.Int32>)>("get_steps");
