class LoginRequest {
  LoginRequest({
    required this.username,
    required this.password,
    this.turnstileToken,
  });

  final String username;
  final String password;
  final String? turnstileToken;

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        if (turnstileToken != null && turnstileToken!.isNotEmpty)
          'turnstileToken': turnstileToken,
      };
}

class RegisterRequest {
  RegisterRequest({
    required this.username,
    required this.password,
    required this.phone,
    required this.code,
    this.turnstileToken,
  });

  final String username;
  final String password;
  final String phone;
  final String code;
  final String? turnstileToken;

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'phone': phone,
        'code': code,
        if (turnstileToken != null && turnstileToken!.isNotEmpty)
          'turnstileToken': turnstileToken,
      };
}

class ChangePasswordRequest {
  ChangePasswordRequest({
    required this.password,
    required this.newPassword,
  });

  final String password;
  final String newPassword;

  Map<String, dynamic> toJson() => {
        'password': password,
        'newPassword': newPassword,
      };
}

class RetrievePasswordRequest {
  RetrievePasswordRequest({
    required this.phone,
    required this.code,
    required this.password,
    this.turnstileToken,
  });

  final String phone;
  final String code;
  final String password;
  final String? turnstileToken;

  Map<String, dynamic> toJson() => {
        'phone': phone,
        'code': code,
        'password': password,
        if (turnstileToken != null && turnstileToken!.isNotEmpty)
          'turnstileToken': turnstileToken,
      };
}

class SmsVerificationRequest {
  SmsVerificationRequest({required this.phone});

  final String phone;

  Map<String, dynamic> toJson() => {
        'phone': phone,
      };
}

class TokenResponse {
  const TokenResponse({
    required this.token,
    required this.expire,
  });

  final String? token;
  final int? expire;

  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    return TokenResponse(
      token: json['token'] as String?,
      expire: (json['expire'] as num?)?.toInt(),
    );
  }
}

class UserInfo {
  const UserInfo({
    required this.id,
    required this.username,
    required this.superAdmin,
    required this.status,
    required this.roles,
    required this.permissions,
  });

  final int id;
  final String? username;
  final int superAdmin;
  final int status;
  final List<String> roles;
  final List<String> permissions;

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: (json['id'] as num?)?.toInt() ?? 0,
      username: json['username'] as String?,
      superAdmin: (json['superAdmin'] as num?)?.toInt() ?? 0,
      status: (json['status'] as num?)?.toInt() ?? 0,
      roles: ((json['roles'] as List?) ?? const [])
          .map((item) => item.toString())
          .toList(),
      permissions: ((json['permissions'] as List?) ?? const [])
          .map((item) => item.toString())
          .toList(),
    );
  }
}
