import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/common/global/global_methods.dart';
import 'package:todo_app/common/helpers/db_helper.dart';
import 'package:todo_app/common/routes/router.dart';
import 'package:todo_app/common/widgets/show_dialog.dart';

final authRepositoryProvider = Provider((ref) {
  return AuthRepository(auth: FirebaseAuth.instance);
});

class AuthRepository {
  final FirebaseAuth auth;
  AuthRepository({required this.auth});

  Future<void> verifyOTP({
    required BuildContext context,
    required String smsCodeID,
    required String smsCode,
    required bool mounted,
  }) async {
    try {
      final credentials = PhoneAuthProvider.credential(
        verificationId: smsCodeID,
        smsCode: smsCode,
      );
      await auth.signInWithCredential(credentials);
      if (!mounted) {
        return;
      }
      GBM.pushAndReplaceNamed(context: context, routeName: Routes.homeRoute);
    } on FirebaseAuthException catch (e) {
      showAlertDialog(
        context: context,
        message: e.toString(),
      );
    }
  }

  Future<void> sendOTP({
    required BuildContext context,
    required String phoneNumber,
  }) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credentials) async {
          await auth.signInWithCredential(credentials);
        },
        verificationFailed: (e) {
          showAlertDialog(
            context: context,
            message: e.toString(),
          );
          print(e);
        },
        codeSent: (smsCodeID, resendCodeID) {
          DBHelper.createUser(1);
          GBM.pushAndReplaceNamed(
            context: context,
            routeName: Routes.otpRoute,
            arguments: {'phoneNumber': phoneNumber, 'smsCodeID': smsCodeID},
          );
        },
        codeAutoRetrievalTimeout: (String smsCodeID) {},
      );
    } on FirebaseAuthException catch (e) {
      showAlertDialog(
        context: context,
        message: e.toString(),
      );
    }
  }
}
