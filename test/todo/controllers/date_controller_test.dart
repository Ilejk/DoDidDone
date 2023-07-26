import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/common/export/export.dart';

void main() {
  group(
    'DateState',
    () {
      test(
        'build method returns AppConsts.empty',
        () {
          final container = ProviderContainer();
          final dateState = container.read(dateStateProvider.notifier);
          final result = dateState.build();
          expect(
            result,
            equals(AppConsts.empty),
          );
          container.dispose();
        },
      );

      test(
        'setDate updates the state',
        () {
          final container = ProviderContainer();
          final dateState = container.read(dateStateProvider.notifier);
          const testDate = '2023-07-26';
          dateState.setDate(testDate);
          expect(
            // ignore: invalid_use_of_protected_member
            dateState.state,
            equals(testDate),
          );
          container.dispose();
        },
      );
    },
  );

  group(
    'StartTimeState',
    () {
      test(
        'build method returns AppConsts.empty',
        () {
          final container = ProviderContainer();
          final startTimeState =
              container.read(startTimeStateProvider.notifier);
          final result = startTimeState.build();
          expect(
            result,
            equals(AppConsts.empty),
          );
          container.dispose();
        },
      );

      test(
        'setStartTime updates the state',
        () {
          final container = ProviderContainer();
          final startTimeState =
              container.read(startTimeStateProvider.notifier);
          const testStartTime = '09:00 AM';
          startTimeState.setStartTime(testStartTime);
          expect(
            // ignore: invalid_use_of_protected_member
            startTimeState.state,
            equals(testStartTime),
          );
          container.dispose();
        },
      );

      test(
        'dates returns correct difference between dates',
        () {
          fakeAsync(
            (fakeAsync) {
              final container = ProviderContainer();
              final startTimeState =
                  container.read(startTimeStateProvider.notifier);
              final startDate = DateTime(2023, 7, 26, 9, 0);
              final currentDate = DateTime(2023, 7, 25, 9, 0);
              fakeAsync.elapse(
                  Duration(milliseconds: currentDate.millisecondsSinceEpoch));
              final result = startTimeState.dates(startDate);
              expect(
                result,
                equals(
                  [1, 0, 0, 0],
                ),
              );
              container.dispose();
            },
          );
        },
      );
    },
  );

  group(
    'EndTimeState',
    () {
      test(
        'build method returns AppConsts.empty',
        () {
          final container = ProviderContainer();
          final endTimeState = container.read(endTimeStateProvider.notifier);
          final result = endTimeState.build();
          expect(result, equals(AppConsts.empty));
          container.dispose();
        },
      );

      test(
        'setEndTime updates the state',
        () {
          final container = ProviderContainer();
          final endTimeState = container.read(endTimeStateProvider.notifier);
          const testEndTime = '06:00 PM';
          endTimeState.setEndTime(testEndTime);
          expect(
            // ignore: invalid_use_of_protected_member
            endTimeState.state,
            equals(testEndTime),
          );
          container.dispose();
        },
      );
    },
  );
}
