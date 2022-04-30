import 'package:flutter_test/flutter_test.dart';

import 'package:shaper/api.dart';

void main() {
  test(Segment, () {
    expect(
      // ignore: prefer_const_constructors
      Segment(text: 'hello'),
      // ignore: prefer_const_constructors
      Segment(text: 'hello'),
    );
  });
}
