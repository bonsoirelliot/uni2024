import 'dart:async';

import 'package:dart_api/models/player/player_dto.dart';
import 'package:dart_api/models/player/player_model.dart';

abstract interface class PlayersRepository {
  Future<void> init();
  Future<void> dispose();
  FutureOr<List<PlayerDto>> getPlayers();
  FutureOr<PlayerDto?> getPlayer(int id);
  FutureOr<PlayerModel> addPlayer(PlayerDto player);
  FutureOr<void> deletePlayer(int id);
  FutureOr<void> updatePlayer(int id, PlayerDto player);
}