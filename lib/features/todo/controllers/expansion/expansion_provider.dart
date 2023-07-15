import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expansion_provider.g.dart';

@riverpod
class ExpansionState extends _$ExpansionState {
  @override
  bool build() {
    return true;
  }

  void setStart(bool newState) {
    state = newState;
  }
}
