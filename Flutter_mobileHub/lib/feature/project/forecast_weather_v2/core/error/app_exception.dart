

// Map từ: sealed class AppException : Exception() bên Kotlin
abstract class AppException implements Exception {
  final String message;
  AppException(this.message);
}

class NetworkException extends AppException{
  NetworkException(super.message);
}

class ServerException extends AppException{
  ServerException(super.message);
}

class CacheException extends AppException{
  CacheException(super.message);
}

class UnknownException extends AppException {
  UnknownException(super.message);
}
