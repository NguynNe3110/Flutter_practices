import 'package:drift/drift.dart';

import '../../domain/entities/user_domain.dart';
import '../local/database/drift/app_database.dart';

// 1. Map từ Drift Data Class (User) -> Domain (UserDomain)
extension UserMapper on User {
  UserDomain toDomain() {
    return UserDomain(id: id, fullName: fullName, age: age);
  }
}

// 2. Map từ Domain (UserDomain) -> Drift Companion (để insert)
extension UserDomainMapper on UserDomain {
  UsersCompanion toCompanion() {
    return UsersCompanion.insert(
      fullName: fullName,
      age: Value(age), // Value() bọc nullable field
    );
  }
}