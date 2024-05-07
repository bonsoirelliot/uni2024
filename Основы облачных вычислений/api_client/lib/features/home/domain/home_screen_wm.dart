import 'package:api_client/core/di/dependencies.dart';
import 'package:api_client/features/home/data/models.dart';
import 'package:api_client/features/home/domain/home_screen_model.dart';
import 'package:api_client/features/home/presentation/home_screen.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';

abstract interface class IHomeScreenWM implements IWidgetModel {
  EntityValueListenable<List<Item>> get itemsListenable;
  EntityValueListenable<List<ItemType>> get itemTypesListenable;
  EntityValueListenable<List<Location>> get locationsListenable;
  EntityValueListenable<List<Player>> get playersListenable;
  EntityValueListenable<List<Message>> get messagesListenable;

  Future<void> loadItems();
  Future<void> addItem(ItemDTO item);
  Future<void> editItem(int id, ItemDTO item);
  Future<void> deleteItem(int id);

  Future<void> loadItemTypes();
  Future<void> addItemType(ItemTypeDTO item);
  Future<void> editItemType(int id, ItemTypeDTO item);
  Future<void> deleteItemType(int id);

  Future<void> loadLocations();
  Future<void> addLocation(LocationDTO item);
  Future<void> editLocation(int id, LocationDTO item);
  Future<void> deleteLocation(int id);

  Future<void> loadPlayers();
  Future<void> addPlayer(PlayerDTO item);
  Future<void> editPlayer(int id, PlayerDTO item);
  Future<void> deletePlayer(int id);

  Future<void> loadMessages();
  Future<void> addMessage(MessageDTO item);
  Future<void> editMessage(int id, MessageDTO item);
  Future<void> deleteMessage(int id);

  Future<void> loadAllData();
}

HomeScreenWM defaultHomeScreenWMFactory(BuildContext context) {
  return HomeScreenWM(HomeScreenModel(
    requestHandler: Dependencies.of(context).requestHandler,
  ));
}

class HomeScreenWM extends WidgetModel<HomeScreen, HomeScreenModel> implements IHomeScreenWM {
  HomeScreenWM(HomeScreenModel model) : super(model);

  late final executor = Dependencies.of(context).executor;

  ///
  final _itemsState = EntityStateNotifier<List<Item>>();
  final _itemTypesState = EntityStateNotifier<List<ItemType>>();
  final _playersState = EntityStateNotifier<List<Player>>();
  final _locationsState = EntityStateNotifier<List<Location>>();
  final _messagesState = EntityStateNotifier<List<Message>>();

  @override
  EntityValueListenable<List<Item>> get itemsListenable => _itemsState;

  @override
  EntityValueListenable<List<ItemType>> get itemTypesListenable => _itemTypesState;

  @override
  EntityValueListenable<List<Player>> get playersListenable => _playersState;

  @override
  EntityValueListenable<List<Location>> get locationsListenable => _locationsState;

  @override
  EntityValueListenable<List<Message>> get messagesListenable => _messagesState;

  @override
  Future<void> loadAllData() async {
    Future.wait([
      loadItemTypes(),
      loadItems(),
      loadPlayers(),
      loadMessages(),
      loadLocations(),
    ]);
  }

  /// ITEMS
  @override
  Future<void> loadItems() async {
    await executor.execute(
      model.loadItems,
      before: _itemsState.loading,
      onError: _itemsState.error,
      onSuccess: (data) => _itemsState.content(data!),
    );
  }

  @override
  Future<void> addItem(ItemDTO item) async {
    final _lastData = _itemsState.value.data ?? <Item>[];

    await executor.execute(
      () => model.addItem(item),
      before: _itemsState.loading,
      onError: _itemsState.error,
      onSuccess: (data) {
        _itemsState.content([
          ..._lastData,
          data!,
        ]);
      },
    );
  }

  @override
  Future<void> editItem(int id, ItemDTO item) async {
    await executor.execute(
      () => model.editItem(id, item),
      before: _itemsState.loading,
      onError: _itemsState.error,
      onSuccess: (data) => loadItems(),
    );
  }

  @override
  Future<void> deleteItem(int id) async {
    await executor.execute(
      () => model.deleteItem(id),
      before: _itemsState.loading,
      onError: _itemsState.error,
      onSuccess: (data) => loadItems(),
    );
  }

  /// ITEMTYPES
  @override
  Future<void> loadItemTypes() async {
    await executor.execute(
      model.loadItemTypes,
      before: _itemTypesState.loading,
      onError: _itemTypesState.error,
      onSuccess: (data) => _itemTypesState.content(data!),
    );
  }

  @override
  Future<void> addItemType(ItemTypeDTO item) async {
    final _lastData = _itemTypesState.value.data ?? <ItemType>[];

    await executor.execute(
      () => model.addItemType(item),
      before: _itemTypesState.loading,
      onError: _itemTypesState.error,
      onSuccess: (data) {
        _itemTypesState.content([
          ..._lastData,
          data!,
        ]);
      },
    );
  }

  @override
  Future<void> editItemType(int id, ItemTypeDTO item) async {
    await executor.execute(
      () => model.editItemType(id, item),
      before: _itemTypesState.loading,
      onError: _itemTypesState.error,
      onSuccess: (data) => loadItems(),
    );
  }

  @override
  Future<void> deleteItemType(int id) async {
    await executor.execute(
      () => model.deleteItem(id),
      before: _itemTypesState.loading,
      onError: _itemTypesState.error,
      onSuccess: (data) => loadItems(),
    );
  }

  /// Locations
  @override
  Future<void> loadLocations() async {
    await executor.execute(
      model.loadLocations,
      before: _locationsState.loading,
      onError: _locationsState.error,
      onSuccess: (data) => _locationsState.content(data!),
    );
  }

  @override
  Future<void> addLocation(LocationDTO item) async {
    final _lastData = _locationsState.value.data ?? <Location>[];

    await executor.execute(
      () => model.addLocation(item),
      before: _locationsState.loading,
      onError: _locationsState.error,
      onSuccess: (data) {
        _locationsState.content([
          ..._lastData,
          data!,
        ]);
      },
    );
  }

  @override
  Future<void> editLocation(int id, LocationDTO item) async {
    await executor.execute(
      () => model.editLocation(id, item),
      before: _locationsState.loading,
      onError: _locationsState.error,
      onSuccess: (data) => loadItems(),
    );
  }

  @override
  Future<void> deleteLocation(int id) async {
    await executor.execute(
      () => model.deleteLocation(id),
      before: _locationsState.loading,
      onError: _locationsState.error,
      onSuccess: (data) => loadItems(),
    );
  }

  /// Messages
  @override
  Future<void> loadMessages() async {
    await executor.execute(
      model.loadMessages,
      before: _messagesState.loading,
      onError: _messagesState.error,
      onSuccess: (data) => _messagesState.content(data!),
    );
  }

  @override
  Future<void> addMessage(MessageDTO item) async {
    final _lastData = _messagesState.value.data ?? <Message>[];

    await executor.execute(
      () => model.addMessage(item),
      before: _messagesState.loading,
      onError: _messagesState.error,
      onSuccess: (data) {
        _messagesState.content([
          ..._lastData,
          data!,
        ]);
      },
    );
  }

  @override
  Future<void> editMessage(int id, MessageDTO item) async {
    await executor.execute(
      () => model.editMessage(id, item),
      before: _messagesState.loading,
      onError: _messagesState.error,
      onSuccess: (data) => loadItems(),
    );
  }

  @override
  Future<void> deleteMessage(int id) async {
    await executor.execute(
      () => model.deleteMessage(id),
      before: _messagesState.loading,
      onError: _messagesState.error,
      onSuccess: (data) => loadItems(),
    );
  }

  /// Players
  @override
  Future<void> loadPlayers() async {
    await executor.execute(
      model.loadPlayers,
      before: _playersState.loading,
      onError: _playersState.error,
      onSuccess: (data) => _playersState.content(data!),
    );
  }

  @override
  Future<void> addPlayer(PlayerDTO item) async {
    final _lastData = _playersState.value.data ?? <Player>[];

    await executor.execute(
      () => model.addPlayer(item),
      before: _playersState.loading,
      onError: _playersState.error,
      onSuccess: (data) {
        _playersState.content([
          ..._lastData,
          data!,
        ]);
      },
    );
  }

  @override
  Future<void> editPlayer(int id, PlayerDTO item) async {
    await executor.execute(
      () => model.editPlayer(id, item),
      before: _playersState.loading,
      onError: _playersState.error,
      onSuccess: (data) => loadItems(),
    );
  }

  @override
  Future<void> deletePlayer(int id) async {
    await executor.execute(
      () => model.deletePlayer(id),
      before: _playersState.loading,
      onError: _playersState.error,
      onSuccess: (data) => loadItems(),
    );
  }

  @override
  void initWidgetModel() {
    loadAllData();
    super.initWidgetModel();
  }
}
