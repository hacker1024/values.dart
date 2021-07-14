library values;

import 'dart:convert';

/// A [Codec] that serializes and deserializes key-value pairs with an `=`
/// separator.
class ValuesCodec extends Codec<Map<String, String>, String> {
  const ValuesCodec();

  @override
  Converter<Map<String, String>, String> get encoder => const ValuesEncoder();

  @override
  Converter<String, Map<String, String>> get decoder => const ValuesDecoder();
}

/// A [Converter] that serializes key-value pairs with an `=` separator.
class ValuesEncoder extends Converter<Map<String, String>, String> {
  const ValuesEncoder();

  @override
  String convert(Map<String, String> input) =>
      input.entries.map((entry) => '${entry.key}=${entry.value}').join('\n');
}

/// A [Converter] that deserializes key-value pairs with an `=` separator.
class ValuesDecoder extends Converter<String, Map<String, String>> {
  const ValuesDecoder();

  @override
  Map<String, String> convert(String input) {
    final output = <String, String>{};
    for (final line in LineSplitter.split(input)) {
      final separatorIndex = line.indexOf('=');
      if (separatorIndex == -1) {
        throw FormatException('No separator found in line!', line);
      }
      output[line.substring(0, separatorIndex)] =
          line.substring(separatorIndex + 1);
    }
    return output;
  }
}
