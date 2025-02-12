class ApiException implements Exception {
  final String kind;
  final String content;

  ApiException({required this.kind, required this.content});

  @override
  String toString() {
    return "ApiException: kind=$kind, content=$content";
  }
}
