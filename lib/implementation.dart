import 'api.dart';

class SegmenterImpl implements Segmenter {
  static final List<int> _supportedCodeUnits = (
    'abcdefghijklmnopqrstuvwxyz'
    'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    '0123456789'
    ' .,?!'
  ).codeUnits;

  @override
  Iterable<Segment> segment(String text) {
    final List<int> codeUnits = text.codeUnits;
    for (int i = 0; i < codeUnits.length; i++) {
      final int codeUnit = codeUnits[i];
      if (!_supportedCodeUnits.contains(codeUnit)) {
        throw ArgumentError.value(
          text,
          'text',
          'Contains unsupported code unit $codeUnit ("${String.fromCharCode(codeUnit)}") at index $i.',
        );
      }
    }
    return text.split(RegExp(r'\s')).map((s) => Segment(text: s));
  }
}

class ShaperImpl implements Shaper {
  @override
  Metrics shape(Span span) {
    final double glyphWidth = span.fontSize / 2;
    return Metrics(
      span: span,
      width: glyphWidth * span.segment.text.length,
      height: span.fontSize,
    );
  }
}
