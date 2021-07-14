# Values

A [`Codec`][Codec] implementation that serializes and deserializes key-value pairs with an
`=` separator.

## Example
Input:
```dart
{
  'Value1': 'A',
  'Value2': 'B',
  'Value3': 'C',
}
```

Output:
```properties
Value1=A
Value2=B
Value3=C
```

## Usage
See the example for example usage.
The standard [`Codec`][Codec] interface implemented by `ValuesCodec`.

[Codec]: https://api.dart.dev/stable/2.13.4/dart-convert/Codec-class.html

## Roadmap
- Chunked conversions