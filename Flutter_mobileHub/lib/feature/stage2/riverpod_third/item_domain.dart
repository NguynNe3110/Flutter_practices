import 'dart:ffi';

class ItemDomain {
  final String id;
  final String name;
  final int age;

  const ItemDomain({
    required this.id, required this.name, required this.age
  });

  ItemDomain copyWith({String? id, String? name, int?age}) {
    return ItemDomain(id: id ?? this.id, name: name ?? this.name, age: age ?? this.age);
  }

}