import 'package:openapi/openapi.dart' as generated;

import '../models/api_result.dart';
import '../models/auth_models.dart';
import 'api_client.dart';

class AuthApiService {
  AuthApiService({required ApiClient client}) : _client = client;

  final ApiClient _client;

  Future<ApiResult<TokenResponse>> login(LoginRequest request) {
    return _client.request<generated.AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDto, TokenResponse>(
      method: 'POST',
      path: '/user/login',
      send: (headers) => _client.authApi.userLoginPost(
        aiAdminServicesAuthDtosLoginDto: generated.AiAdminServicesAuthDtosLoginDto(
          (generated.AiAdminServicesAuthDtosLoginDtoBuilder b) {
            b.username = request.username;
            b.password = request.password;
            b.turnstileToken = request.turnstileToken;
          },
        ),
        headers: headers,
      ),
      mapResult: (body) {
        final token = body?.data;
        return ApiResult<TokenResponse>(
          code: body?.code ?? 1,
          msg: body?.msg ?? '登录失败',
          data: token == null
              ? null
              : TokenResponse(
                  token: token.token,
                  expire: token.expire,
                ),
        );
      },
    );
  }

  Future<ApiResult<Object?>> register(RegisterRequest request) {
    return _client.request<generated.AiAdminInfrastructureResultSystemObject, Object?>(
      method: 'POST',
      path: '/user/register',
      send: (headers) => _client.authApi.userRegisterPost(
        aiAdminServicesAuthDtosRegisterDto: generated.AiAdminServicesAuthDtosRegisterDto(
          (generated.AiAdminServicesAuthDtosRegisterDtoBuilder b) {
            b.username = request.username;
            b.password = request.password;
            b.phone = request.phone;
            b.code = request.code;
            b.turnstileToken = request.turnstileToken;
          },
        ),
        headers: headers,
      ),
      mapResult: (body) => _objectResult(body, '注册失败'),
    );
  }

  Future<ApiResult<Object?>> sendSmsCode(SmsVerificationRequest request) {
    return _client.request<generated.AiAdminInfrastructureResultSystemObject, Object?>(
      method: 'POST',
      path: '/user/smsVerification',
      send: (headers) => _client.authApi.userSmsVerificationPost(
        aiAdminServicesAuthDtosSmsVerificationDto: generated.AiAdminServicesAuthDtosSmsVerificationDto(
          (generated.AiAdminServicesAuthDtosSmsVerificationDtoBuilder b) {
            b.phone = request.phone;
          },
        ),
        headers: headers,
      ),
      mapResult: (body) => _objectResult(body, '发送失败'),
    );
  }

  Future<ApiResult<Object?>> changePassword(
    ChangePasswordRequest request,
    String token,
  ) {
    return _client.request<generated.AiAdminInfrastructureResultSystemObject, Object?>(
      method: 'PUT',
      path: '/user/change-password',
      token: token,
      send: (headers) => _client.authApi.userChangePasswordPut(
        aiAdminServicesAuthDtosPasswordDto: generated.AiAdminServicesAuthDtosPasswordDto(
          (generated.AiAdminServicesAuthDtosPasswordDtoBuilder b) {
            b.password = request.password;
            b.newPassword = request.newPassword;
          },
        ),
        headers: headers,
      ),
      mapResult: (body) => _objectResult(body, '修改密码失败'),
    );
  }

  Future<ApiResult<Object?>> retrievePassword(
    RetrievePasswordRequest request,
  ) {
    return _client.request<generated.AiAdminInfrastructureResultSystemObject, Object?>(
      method: 'PUT',
      path: '/user/retrieve-password',
      send: (headers) => _client.authApi.userRetrievePasswordPut(
        aiAdminServicesAuthDtosRetrievePasswordDto: generated.AiAdminServicesAuthDtosRetrievePasswordDto(
          (generated.AiAdminServicesAuthDtosRetrievePasswordDtoBuilder b) {
            b.phone = request.phone;
            b.code = request.code;
            b.password = request.password;
            b.turnstileToken = request.turnstileToken;
          },
        ),
        headers: headers,
      ),
      mapResult: (body) => _objectResult(body, '找回密码失败'),
    );
  }

  Future<ApiResult<UserInfo>> getUserInfo(String token) {
    return _client.request<generated.AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDto, UserInfo>(
      method: 'GET',
      path: '/user/info',
      token: token,
      send: (headers) => _client.authApi.userInfoGet(headers: headers),
      mapResult: (body) {
        final user = body?.data;
        return ApiResult<UserInfo>(
          code: body?.code ?? 1,
          msg: body?.msg ?? '获取用户信息失败',
          data: user == null
              ? null
              : UserInfo(
                  id: user.id ?? 0,
                  username: user.username,
                  superAdmin: user.superAdmin ?? 0,
                  status: user.status ?? 0,
                  roles: user.roles?.toList() ?? const [],
                  permissions: user.permissions?.toList() ?? const [],
                ),
        );
      },
    );
  }

  ApiResult<Object?> _objectResult(
    generated.AiAdminInfrastructureResultSystemObject? body,
    String fallbackMessage,
  ) {
    return ApiResult<Object?>(
      code: body?.code ?? 1,
      msg: body?.msg ?? fallbackMessage,
      data: null,
    );
  }
}
