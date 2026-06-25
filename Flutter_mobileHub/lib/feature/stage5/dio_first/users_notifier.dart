import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dio_client.dart';
import 'get_users_usecase.dart';
import 'user_state.dart';
import 'user_remote_datasource.dart';
import 'user_repository_impl.dart';

// 1. Định nghĩa Provider (Map sang @HiltViewModel + ViewModelFactory)
// Đây là nơi Riverpod biết cách tạo ra UseCase -> Repo -> DataSource -> Dio
final getUsersUseCaseProvider = Provider<GetUsersUseCase>((ref) {
  final dio = DioClient.createDio();
  final remoteDs = UserRemoteDataSource(dio);
  final repo = UserRepositoryImpl(remoteDs);
  return GetUsersUseCase(repo);
});

// 2. ViewModel (Map sang LoginViewModel.kt)
class UsersNotifier extends Notifier<UsersState> {
  late final GetUsersUseCase _getUsersUseCase;

  @override
  UsersState build() {
    // Inject UseCase (Trong Riverpod, ta lấy từ ref.read)
    _getUsersUseCase = ref.read(getUsersUseCaseProvider);
    return const UsersState(); // State mặc định
  }

  // Map sang Kotlin: fun getUsers() { viewModelScope.launch { ... } }
  Future<void> fetchUsers() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final users = await _getUsersUseCase.call();
      state = state.copyWith(isLoading: false, users: users);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

// 3. Khai báo NotifierProvider (Để UI có thể gọi)
final usersProvider = NotifierProvider<UsersNotifier, UsersState>(UsersNotifier.new);