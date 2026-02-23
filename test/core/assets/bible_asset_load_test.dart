import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Bible DB asset is bundled and non-empty', () async {
    final ByteData data = await rootBundle.load('assets/db/Bible.db');
    expect(data.lengthInBytes, greaterThan(0));
  });
}
