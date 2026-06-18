
class MockRemoteDatasource {
  Future<List<String>> getUsers() async {
    await Future.delayed(Duration(seconds: 2));

    if(DateTime.now().second % 5 == 0) {
      throw Exception("Server Error 500");
    }

    return ["Alice", "Bob", "nguyen", "nguyen 2", "nguyen3", "nguyen 4", "nguyen 5"];
  }
}