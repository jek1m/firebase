
import 'package:flutter_application_firebase/data/repository/local_repository.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('BookRepository test', () async {
    //
    LocalRepository localRepository = LocalRepository();
    final locals = await localRepository.searchLocal('902');
    expect(locals.isEmpty, false);
    for (var local in locals) {
      print(local.toJson());
    }
  });
}