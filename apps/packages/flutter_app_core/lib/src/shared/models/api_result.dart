class ApiResult<T> {
  const ApiResult({
    required this.code,
    required this.msg,
    required this.data,
  });

  final int code;
  final String msg;
  final T? data;

  bool get isSuccess => code == 0;
  bool get isUnauthorized => code == 401 || code == 403;

  factory ApiResult.fromJson(
    Map<String, dynamic> json,
    T? Function(dynamic value) parser,
  ) {
    return ApiResult<T>(
      code: (json['code'] as num?)?.toInt() ?? 1,
      msg: (json['msg'] as String?) ?? 'error',
      data: parser(json['data']),
    );
  }
}
