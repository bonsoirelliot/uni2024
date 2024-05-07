// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_controller.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$PlayerControllerRouter(PlayerController service) {
  final router = Router();
  router.add(
    'GET',
    r'/player/',
    service.listUsers,
  );
  router.add(
    'GET',
    r'/player/<playerId>',
    service.fetchUser,
  );
  return router;
}
