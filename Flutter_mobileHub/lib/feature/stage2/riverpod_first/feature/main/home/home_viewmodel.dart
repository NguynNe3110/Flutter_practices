import 'package:flutter_mobilehub/feature/stage2/riverpod_first/data/remote/datasources/mock_remote_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/remote/datasources/mock_remote_datasource.dart';
import '../../../data/repositories/user_repository_impl.dart';
import '../../../domain/repositories/user_repository.dart';


part 'home_viewmodel.g.dart'; // File này sẽ được build_runner tự sinh ra

// 1. Khai báo Provider cho Repository (Inject Dependency)
@riverpod
UserRepository userRepository(Ref ref) {
  // ref.read dùng để lấy provider khác (giống @Inject)
  return UserRepositoryImpl(MockRemoteDatasource());
}

// 2. Khai báo ViewModel (AsyncNotifier)
@riverpod
class HomeViewModel extends _$HomeViewModel {

  // Hàm build() chạy 1 lần duy nhất khi ViewModel được khởi tạo.
  // Tương đương init {} trong Kotlin ViewModel.
  @override
  Future<List<String>> build() async {
    // Lấy repository từ provider đã khai báo ở trên
    final repo = ref.read(userRepositoryProvider);
    return repo.getUser(); // Trả về Future, Riverpod tự bọc vào AsyncValue
  }

  // Hàm custom để Refresh
  Future<void> refresh() async {
    // AsyncValue.guard tự động bắt try-catch và chuyển thành .error hoặc .data
    state = await AsyncValue.guard(() => ref.read(userRepositoryProvider).getUser());
  }
}