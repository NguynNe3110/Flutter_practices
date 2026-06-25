import 'user_domain.dart';


//co cach quan lý 3 trạng thái load, success , erorr tự động
class UsersState {
  final bool isLoading;
  final List<UserDomain> users;
  final String? error;

  UsersState({
    this.isLoading = false,
    this.users = const [],
    this.error,
  });

  UsersState copyWith({
    bool? isLoading,
    List<UserDomain>? users,
    String? error,
  }) {
    return UsersState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      error: error,
    );
  }
}