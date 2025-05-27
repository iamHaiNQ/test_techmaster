import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

final DynamicLibrary nativeLib = () {
  if (Platform.isAndroid) {
    return DynamicLibrary.open('libeight_queens.so'); // tên file đã được build
  } else if (Platform.isWindows) {
    return DynamicLibrary.open('native/eight_queens.dll');
  } else {
    throw UnsupportedError('Unsupported platform');
  }
}();


final void Function(Pointer<Int32>, int) solve8Queens = nativeLib
    .lookup<NativeFunction<Void Function(Pointer<Int32>, Int32)>>('solve_8_queens')
    .asFunction();


List<List<int>> getQueensSolutions({int limit = 92}) {
  final ptr = calloc<Int32>(limit * 8);
  solve8Queens(ptr, limit);

  final results = List.generate(limit, (i) =>
      List.generate(8, (j) => ptr[i * 8 + j])
  );

  calloc.free(ptr);
  return results;
}
