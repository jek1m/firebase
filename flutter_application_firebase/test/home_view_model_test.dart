import 'package:flutter_application_firebase/ui/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("HomeViewModel test", () async {
    final providerContainer = ProviderContainer();
    addTearDown(providerContainer.dispose);
    final homeVm = providerContainer.read(HomeViewModelProvider.notifier);
    final firstState = providerContainer.read(HomeViewModelProvider);
    expect(firstState.locals.isEmpty, true);

    await homeVm.searchLocals("9");
    final afterState = providerContainer.read(HomeViewModelProvider);
    expect(afterState.locals.isEmpty, false);

    afterState.locals.forEach((element) {
      print(element.toJson());
    });
  });
}