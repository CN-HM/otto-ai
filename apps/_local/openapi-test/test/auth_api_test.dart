import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AuthApi
void main() {
  final instance = Openapi().getAuthApi();

  group(AuthApi, () {
    //Future<AiAdminInfrastructureResultSystemObject> userChangePasswordPut({ AiAdminServicesAuthDtosPasswordDto aiAdminServicesAuthDtosPasswordDto }) async
    test('test userChangePasswordPut', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDto> userInfoGet() async
    test('test userInfoGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDto> userLoginPost({ AiAdminServicesAuthDtosLoginDto aiAdminServicesAuthDtosLoginDto }) async
    test('test userLoginPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDto> userPubConfigGet() async
    test('test userPubConfigGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> userRegisterPost({ AiAdminServicesAuthDtosRegisterDto aiAdminServicesAuthDtosRegisterDto }) async
    test('test userRegisterPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> userRetrievePasswordPut({ AiAdminServicesAuthDtosRetrievePasswordDto aiAdminServicesAuthDtosRetrievePasswordDto }) async
    test('test userRetrievePasswordPut', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> userSmsVerificationPost({ AiAdminServicesAuthDtosSmsVerificationDto aiAdminServicesAuthDtosSmsVerificationDto }) async
    test('test userSmsVerificationPost', () async {
      // TODO
    });

  });
}
