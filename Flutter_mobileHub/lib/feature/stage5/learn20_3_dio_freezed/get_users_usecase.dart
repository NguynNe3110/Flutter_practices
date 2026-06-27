import 'user_repository.dart';
import 'user_domain.dart';

// Map sang Kotlin: class GetUsersUseCase @Inject constructor(...)
class GetUsersUseCase {
  final UserRepository _repository;

  GetUsersUseCase(this._repository);

  // Trong Kotlin bạn dùng operator fun invoke(), trong Dart gọi trực tiếp hàm call()
  Future<List<UserDomain>> call() async {
    return await _repository.getUsers();
  }
}