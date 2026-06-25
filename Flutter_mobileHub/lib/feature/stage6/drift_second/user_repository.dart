
import 'package:flutter_mobilehub/feature/stage2/riverpod_second/domain/entities/user_entity.dart';

abstract class UserRepository {
  Stream<List<UserEntity>> watchObserverUsers();

  Future<void> addUser(UserEntity user);
}