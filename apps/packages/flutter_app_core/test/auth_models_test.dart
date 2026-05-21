import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_core/flutter_app_core.dart';

void main() {
  test('UserInfo parses roles and permissions', () {
    final user = UserInfo.fromJson({
      'id': 1,
      'username': 'admin',
      'superAdmin': 1,
      'status': 1,
      'roles': ['admin'],
      'permissions': ['device.read'],
    });

    expect(user.id, 1);
    expect(user.username, 'admin');
    expect(user.roles, ['admin']);
    expect(user.permissions, ['device.read']);
  });
}
