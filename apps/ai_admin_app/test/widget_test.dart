import 'package:flutter_test/flutter_test.dart';
import 'package:ai_admin_app/main.dart' as app;

void main() {
  test('baseline app entry is exposed', () {
    expect(app.main, isA<Function>());
  });
}
