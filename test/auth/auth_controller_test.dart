import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/common/export/export.dart';
import 'package:todo_app/features/auth/repository/auth_repository.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  group(
    'AuthController',
    () {
      late AuthController authController;
      late MockAuthRepository mockAuthRepository;

      setUp(
        () {
          mockAuthRepository = MockAuthRepository();
          authController = AuthController(authRepository: mockAuthRepository);
        },
      );

      test(
        'verifyOTP calls verifyOTP method from AuthRepository',
        () async {
          final context = MockBuildContext();
          const smsCodeID = '123456';
          const smsCode = '123456';
          const mounted = true;

          authController.verifyOTP(
            context: context,
            smsCodeID: smsCodeID,
            smsCode: smsCode,
            mounted: mounted,
          );

          verify(
            mockAuthRepository.verifyOTP(
              context: context,
              smsCodeID: smsCodeID,
              smsCode: smsCode,
              mounted: mounted,
            ),
          ).called(1);
        },
      );

      test(
        'sendSMS calls sendOTP method from AuthRepository',
        () {
          final context = MockBuildContext();
          const phoneNumber = '+1234567890';

          when(
            mockAuthRepository.sendOTP(
              context: context,
              phoneNumber: phoneNumber,
            ),
          ).thenAnswer(
            (_) => Future.value(),
          );

          authController.sendSMS(
            context: context,
            phoneNumber: phoneNumber,
          );

          verify(
            mockAuthRepository.sendOTP(
              context: context,
              phoneNumber: phoneNumber,
            ),
          ).called(1);
        },
      );

      test(
        'logout calls logout method from AuthRepository',
        () async {
          final context = MockBuildContext();

          authController.logout(
            context: context,
          );

          verify(
            mockAuthRepository.logout(
              context: context,
            ),
          ).called(1);
        },
      );

      tearDown(
        () {
          authController = AuthController(
            authRepository: AuthRepository(auth: FirebaseAuth.instance),
          );
        },
      );
    },
  );
}
//TODO: fix