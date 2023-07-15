import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthState extends _$AuthState {
  @override
  String build() {
    return '';
  }

  void setStart(String newState) {
    state = newState;
  }
}
