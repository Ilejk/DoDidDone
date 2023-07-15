import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/common/utils/constants/constants.dart';

part 'date_provider.g.dart';

@riverpod
class DateState extends _$DateState {
  @override
  String build() {
    return AppConsts.empty;
  }

  void setDate(String date) {
    state = date;
  }
}

@riverpod
class StartTimeState extends _$StartTimeState {
  @override
  String build() {
    return AppConsts.empty;
  }

  void setStartTime(String startTime) {
    state = startTime;
  }
}

@riverpod
class EndTimeState extends _$EndTimeState {
  @override
  String build() {
    return AppConsts.empty;
  }

  void setEndTime(String endtime) {
    state = endtime;
  }
}
