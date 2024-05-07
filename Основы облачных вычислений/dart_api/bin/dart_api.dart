import 'package:dart_api/controllers/player_controller.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

class Service {
  Handler get handler {
    final router = Router();

    router.mount('/api/', Api().router.call);

    router.all('/<ignored|.*>', (Request request) {
      return Response.notFound('Page not found');
    });

    return router.call;
  }
}

class Api {
  Future<Response> _messages(Request request) async {
    return Response.ok('[]');
  }

  Router get router {
    final router = Router();

    router.get('/messages', _messages);
    router.get('/messages/', _messages);

    router.mount('/', PlayerController().router.call);

    router.all('/<ignored|.*>', (Request request) => Response.notFound('null'));

    return router;
  }
}

void main() async {
  final service = Service();
  final server = await shelf_io.serve(service.handler, 'localhost', 8080);
  print('Server running on localhost:${server.port}');
}
