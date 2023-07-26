import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/common/export/export.dart';
import 'package:todo_app/features/todo/controllers/expansion/expansion_provider.dart';

void main() {
  group('expansion', () {
    test('build method returns true', () {
      final state = ExpansionState();
      final result = state.build();
      expect(result, equals(true));
    });

    test('setStart updates the state', () {
      final container = ProviderContainer();
      final state = container.read(expansionStateProvider.notifier);
      // ignore: invalid_use_of_protected_member
      expect(state.state, equals(true));

      state.setStart(false);
      // ignore: invalid_use_of_protected_member
      expect(state.state, equals(false));

      state.setStart(true);
      // ignore: invalid_use_of_protected_member
      expect(state.state, equals(true));

      container.dispose();
    });
  });
}
