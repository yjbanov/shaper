import 'dart:ui' show Color;
export 'dart:ui' show Color;

import 'package:meta/meta.dart';
export 'package:meta/meta.dart';

import 'implementation.dart';

/////////////////////
// Data structures //
/////////////////////

/// An unbreakable piece of text
@sealed
@immutable
class Segment {
  const Segment({ required this.text });
  final String text;

  @override
  int get hashCode => text.hashCode;

  @override
  bool operator== (Object? other) {
    return other is Segment && other.text == text;
  }
}

/// A decorated [Segment] of text.
@sealed
@immutable
class Span {
  const Span({
    required this.segment,
    required this.fontSize,
    required this.color,
  });

  final Segment segment;
  final double fontSize;
  final Color color;
}

/// A measured (or shaped) [Span] of text.
@sealed
@immutable
class Metrics {
  const Metrics({
    required this.span,
    required this.width,
    required this.height,
  });

  final Span span;
  final double width;
  final double height;
}

//////////////
// Services //
//////////////

/// Breaks up a piece of text along line-break opportunities.
abstract class Segmenter {
  factory Segmenter() = SegmenterImpl;
  Iterable<Segment> segment(String text);
}

/// Measures a [Span] of text.
abstract class Shaper {
  factory Shaper() = ShaperImpl;
  Metrics shape(Span span);
}
