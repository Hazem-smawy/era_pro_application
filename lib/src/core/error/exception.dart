// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServerExeption implements Exception {
  final String? message;
  ServerExeption({
    this.message,
  });
}

class OfflineExeption implements Exception {
  final String? message;
  OfflineExeption({
    this.message,
  });
}

class EmptyCashExeption implements Exception {
  final String? message;
  EmptyCashExeption({
    this.message,
  });
}
