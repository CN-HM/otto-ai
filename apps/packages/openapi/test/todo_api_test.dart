import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for TodoApi
void main() {
  final instance = Openapi().getTodoApi();

  group(TodoApi, () {
    //Future<AiAdminInfrastructureResultSystemObject> adminTodosIdExecutePost(String id) async
    test('test adminTodosIdExecutePost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> adminTodosPost({ AiAdminControllersCreateTodoDto aiAdminControllersCreateTodoDto }) async
    test('test adminTodosPost', () async {
      // TODO
    });

  });
}
