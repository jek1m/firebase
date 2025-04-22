// 1. 상태 클래스 만들기
import 'package:flutter_application_firebase/data/repository/local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_firebase/data/model/local.dart';

class HomeState {
  List<Local> locals;
  HomeState(this.locals);
}


// 2. 뷰모델 만들기 - Notifier 상속
class HomeViewModel extends Notifier<HomeState>{
  @override
  HomeState build() {
    return HomeState([]);
  }
  
  Future<void> searchLocals(String query) async { // 테스트할때만 리턴타입 바꿔줌
    final localRepository = LocalRepository();
    localRepository.searchLocal(query);
    final locals = await localRepository.searchLocal(query);
    state = HomeState(locals);
  }
}
// 3. 뷰모델 관리자 만들기 - NotifierProvider 객체
final HomeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});