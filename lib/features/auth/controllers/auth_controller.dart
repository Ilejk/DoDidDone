import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/features/auth/repository/auth_repository.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository);
});

class AuthController {
  final AuthRepository authRepository;
  AuthController({required this.authRepository});

  void verifyOTP({
    required BuildContext context,
    required String smsCodeID,
    required String smsCode,
    required bool mounted,
  }) {
    authRepository.verifyOTP(
      context: context,
      smsCodeID: smsCodeID,
      smsCode: smsCode,
      mounted: mounted,
    );
  }

  void sendSMS({
    required BuildContext context,
    required String phoneNumber,
  }) {
    authRepository.sendOTP(
      context: context,
      phoneNumber: phoneNumber,
    );
  }

  void logout({
    required BuildContext context,
  }) {
    authRepository.logout(
      context: context,
    );
  }
}
