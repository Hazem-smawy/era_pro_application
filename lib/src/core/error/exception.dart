// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServerException implements Exception {
  final String? message;
  ServerException({
    this.message,
  });
}

class OfflineException implements Exception {
  final String? message;
  OfflineException({
    this.message,
  });
}

// class EmptyCashException implements Exception {
//   final String? message;
//   EmptyCashException({
//     this.message,
//   });
// }

class LocalStorageException implements Exception {
  final String? message;
  LocalStorageException({
    this.message,
  });
}
