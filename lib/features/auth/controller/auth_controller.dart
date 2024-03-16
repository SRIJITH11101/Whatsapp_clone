// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:whatsapp/features/auth/repository/auth_repository.dart';

final AuthControllerProvider = Provider((ref) {
  final authRepository = ref.watch(AuthRepositoryProvider);
  return AuthController(authRepository: authRepository, ref: ref);
});

class AuthController {
  final ProviderRef<Object?> ref;
  final AuthRepository authRepository;

  AuthController({
    required this.ref,
    required this.authRepository,
  });

  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepository.signInWithPhone(context, phoneNumber);
  }

  void verifyOTP(BuildContext context, String verificationId, String userOTP) {
    authRepository.verifyOTP(
        context: context, verificationId: verificationId, userOTP: userOTP);
  }

  void saveUserDataToFirebase(
      BuildContext context, String name, File? profilePic) {
    authRepository.saveDataToFirestore(
        context: context, name: name, ref: ref, profilePic: profilePic);
  }
}
