
import 'package:flutter_mobilehub/feature/stage2/riverpod_third/item_domain.dart';

class ItemRepository {
  final List<ItemDomain> _items = [];

  Future<List<ItemDomain>> getAll() async => List.from(_items);

  Future<void> add(ItemDomain item) async => _items.add(item);

  Future<void> update(ItemDomain item) async {
    final index = _items.indexWhere((i) => i.id == item.id);
    if(index != -1) _items[index] = item;
  }
}