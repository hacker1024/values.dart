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

## Motivation
This method of serialization is common in APIs and preference storage.  
I don't recommend you use this if you're designing an API or storing your own preferences;
formats like JSON, XML and YAML are much better for that kind of thing. This package is useful
for using this format when you have no other choice.