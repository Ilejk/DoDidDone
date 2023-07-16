import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/common/utils/constants/constants.dart';

part 'code_provider.g.dart';

@riverpod
class CodeState extends _$CodeState {
  @override
  String build() {
    return AppConsts.empty;
  }

  void setCode(String date) {
    state = date;
  }
}
