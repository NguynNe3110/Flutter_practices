import 'package:drift/drift.dart';

// ⚠️ Tên class PHẢI là SỐ NHIỀU (Users)
// Drift sẽ tự sinh ra class User (số ít) ở file users.g.dart
// 1. Định nghĩa bảng (Tương đương @Entity(tableName = "users"))
class Users extends Table {
  // Tương đương @PrimaryKey(autoGenerate = true) val id: Int
  IntColumn get id => integer().autoIncrement()();

  // Tương đương @ColumnInfo(name = "full_name") val fullName: String
  TextColumn get fullName => text().withLength(min: 1, max: 50)();

  // Tương đương val age: Int? (Nullable)
  IntColumn get age => integer().nullable()();

// Tương đương @Ignore (không lưu vào DB)
// Drift không có @Ignore, nếu muốn bỏ qua, chỉ cần không khai báo nó ở đây.
}