import 'package:flutter_mobilehub/feature/stage5/dio_first/user_repository.dart';
import 'package:flutter_mobilehub/feature/stage5/dio_first/user_entity.dart';

// Map sang Kotlin: class GetUsersUseCase @Inject constructor(...)
class GetUsersUseCase {
  final UserRepository _repository;

  GetUsersUseCase(this._repository);

  // Trong Kotlin bạn dùng operator fun invoke(), trong Dart gọi trực tiếp hàm call()
  Future<List<UserEntity>> call() async {
    return await _repository.getUsers();
  }
}