import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'player_controller.g.dart';

class PlayerController {
  @Route.get('/player/')
  Future<Response> listUsers(Request request) async {
    return Response.ok('["user1"]');
  }

  @Route.get('/player/<playerId>')
  Future<Response> fetchUser(Request request, String playerId) async {
    if (playerId == '1') {
      return Response.ok('user1');
    }
    return Response.notFound('no such user');
  }

  Router get router => _$PlayerControllerRouter(this);
}
