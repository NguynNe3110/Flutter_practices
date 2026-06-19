// lib/feature/stage5/drift_first/domain/entities/user_domain.dart
class UserDomain {
  final int? id; // Nullable vì khi tạo mới chưa có id
  final String fullName;
  final int? age;

  UserDomain({this.id, required this.fullName, this.age});
}