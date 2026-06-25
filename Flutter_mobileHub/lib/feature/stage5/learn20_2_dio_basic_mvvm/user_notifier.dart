
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'users_state.dart';
import 'user_repository.dart';

class UsersNotifier extends StateNotifier<UsersState> {
  final UserRepository repository;

  UsersNotifier(this.repository)
      : super(UsersState());

  Future<void> loadUsers() async {
    try {
      state = state.copyWith(isLoading: true);

      final users = await repository.getUsers();

      state = state.copyWith(
        isLoading: false,
        users: users,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}
