// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:api_client/core/common/domain/services/request_handler.dart';
import 'package:api_client/features/home/data/models.dart';
import 'package:elementary/elementary.dart';

class HomeScreenModel extends ElementaryModel {
  HomeScreenModel({
    required this.requestHandler,
  }) : super();

  final RequestHandler requestHandler;

  // Players
  Future<List<Player>> loadPlayers() async {
    final data = (await requestHandler.get('/Players/')).data as List<dynamic>;

    final list = data.map((e) => Player.fromJson(e as Map<String, dynamic>)).toList();

    return list;
  }

  Future<Player> addPlayer(PlayerDTO item) async {
    final _model = (await requestHandler.post(
      '/Players/',
      data: item.toJson(),
    ))
        .data as Map<String, dynamic>;

    final data = Player.fromJson(_model);

    return data;
  }

  Future<void> editPlayer(int id, PlayerDTO item) async {
    await requestHandler.put(
      '/Players/$id',
      data: item.toJson(),
    );
  }

  Future<void> deletePlayer(int id) async {
    await requestHandler.delete(
      '/Players/$id',
    );
  }

  // ItemTypes
  Future<List<ItemType>> loadItemTypes() async {
    final data = (await requestHandler.get('/ItemTypes/')).data as List<dynamic>;

    final list = data.map((e) => ItemType.fromJson(e as Map<String, dynamic>)).toList();

    return list;
  }

  Future<ItemType> addItemType(ItemTypeDTO item) async {
    final _model = (await requestHandler.post(
      '/ItemTypes/',
      data: item.toJson(),
    ))
        .data as Map<String, dynamic>;

    final data = ItemType.fromJson(_model);

    return data;
  }

  Future<void> editItemType(int id, ItemTypeDTO item) async {
    await requestHandler.put(
      '/ItemTypes/$id',
      data: item.toJson(),
    );
  }

  Future<void> deleteItemType(int id) async {
    await requestHandler.delete(
      '/ItemType/$id',
    );
  }

  // Items
  Future<List<Item>> loadItems() async {
    final data = (await requestHandler.get('/Items/')).data as List<dynamic>;

    final list = data.map((e) => Item.fromJson(e as Map<String, dynamic>)).toList();

    return list;
  }

  Future<Item> addItem(ItemDTO item) async {
    final _model = (await requestHandler.post(
      '/Items/',
      data: item.toJson(),
    ))
        .data as Map<String, dynamic>;

    final data = Item.fromJson(_model);

    return data;
  }

  Future<void> editItem(int id, ItemDTO item) async {
    await requestHandler.put(
      '/Items/$id',
      data: item.toJson(),
    );
  }

  Future<void> deleteItem(int id) async {
    await requestHandler.delete(
      '/Items/$id',
    );
  }

  // Locations
  Future<List<Location>> loadLocations() async {
    final data = (await requestHandler.get('/Locations/')).data as List<dynamic>;

    final list = data.map((e) => Location.fromJson(e as Map<String, dynamic>)).toList();

    return list;
  }

  Future<Location> addLocation(LocationDTO item) async {
    final _model = (await requestHandler.post(
      '/Locations/',
      data: item.toJson(),
    ))
        .data as Map<String, dynamic>;

    final data = Location.fromJson(_model);

    return data;
  }

  Future<void> editLocation(int id, LocationDTO item) async {
    await requestHandler.put(
      '/Locations/$id',
      data: item.toJson(),
    );
  }

  Future<void> deleteLocation(int id) async {
    await requestHandler.delete(
      '/Locations/$id',
    );
  }

  // Messages
  Future<List<Message>> loadMessages() async {
    final data = (await requestHandler.get('/Messages/')).data as List<dynamic>;

    final list = data.map((e) => Message.fromJson(e as Map<String, dynamic>)).toList();

    return list;
  }

  Future<Message> addMessage(MessageDTO item) async {
    final _model = (await requestHandler.post(
      '/Messages/',
      data: item.toJson(),
    ))
        .data as Map<String, dynamic>;

    final data = Message.fromJson(_model);

    return data;
  }

  Future<void> editMessage(int id, MessageDTO item) async {
    await requestHandler.put(
      '/Messages/$id',
      data: item.toJson(),
    );
  }

  Future<void> deleteMessage(int id) async {
    await requestHandler.delete(
      '/Messages/$id',
    );
  }
}
