// ignore_for_file: avoid_print

import 'package:values/values.dart';

void main() {
  print('Input:');
  const input = {
    'Value1': 'A',
    'Value2': 'B',
    'Value3': 'C',
  };
  print(input);
  print('');

  print('Encoding:');
  final encodedOutput = const ValuesCodec().encoder.convert(input);
  print(encodedOutput);
  print('');

  print('Decoding:');
  final decodedOutput = const ValuesCodec().decoder.convert(encodedOutput);
  print(decodedOutput);
}
