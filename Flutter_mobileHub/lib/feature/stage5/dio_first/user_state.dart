import 'package:flutter_mobilehub/feature/stage5/dio_first/user_domain.dart';

// Map sang Kotlin: data class UsersUiState(val isLoading: Boolean, val users: List<UserEntity>?, val error: String?)
class UsersState {
  final bool isLoading;
  final List<UserDomain>? users;
  final String? error;

  const UsersState({this.isLoading = false, this.users, this.error});

  UsersState copyWith({
    bool? isLoading, List<UserDomain>? users, String? error
  }) {
    return UsersState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      error: error ?? this.error,
    );
  }
}