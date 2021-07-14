import 'package:test/test.dart';
import 'package:values/values.dart';

void main() {
  group('Encoding', () {
    test('Basic encoding', () {
      const codec = ValuesCodec();
      const input = {
        '1': 'A',
        'Test2': 'ResultB',
        '==': '==',
      };
      const expectedOutput = '1=A\n'
          'Test2=ResultB\n'
          '=====';
      expect(codec.encoder.convert(input), expectedOutput);
    });
  });

  group('Decoding', () {
    test('Basic decoding', () {
      const codec = ValuesCodec();
      const input = '1=A\n'
          'Test2=ResultB\n'
          '=====';
      const expectedOutput = {
        '1': 'A',
        'Test2': 'ResultB',
        '': '====', // The first separator symbol is used as the separator.
      };
      expect(codec.decoder.convert(input), expectedOutput);
    });

    test('Erroneous decoding', () {
      const codec = ValuesCodec();
      const input = '1=A\n'
          'Test2=ResultB\n'
          '=====\n'
          'NoSeparatorHere!';
      expect(() => codec.decoder.convert(input), throwsFormatException);
    });
  });
}
