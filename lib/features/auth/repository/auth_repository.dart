import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/commons/repositories/common_fbStorage_repo.dart';
import 'package:whatsapp/commons/utils/utils.dart';
import 'package:whatsapp/features/auth/screens/otp_screen.dart';
import 'package:whatsapp/features/auth/screens/user_info_screen.dart';
import 'package:whatsapp/models/user_model.dart';
import 'package:whatsapp/screens/mobile_layout_screen.dart';

final AuthRepositoryProvider = Provider(
  (ref) => AuthRepository(
      auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance),
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  AuthRepository({required this.auth, required this.firestore});

  void signInWithPhone(BuildContext context, String phonenumber) async {
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phonenumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          },
          verificationFailed: (e) {
            throw Exception(e.message);
          },
          codeSent: ((String verificationId, int? resendToken) async {
            Navigator.pushNamed(context, OTPScreen.routeName,
                arguments: verificationId);
          }),
          codeAutoRetrievalTimeout: (String verificationId) {});
    } on FirebaseAuthException catch (e) {
      showSnackbar(context: context, content: e.toString());
    }
  }

  void verifyOTP(
      {required BuildContext context,
      required String verificationId,
      required String userOTP}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOTP);
      Navigator.pushNamedAndRemoveUntil(
          context, UserInfoScreen.routeName, (route) => false);
      await auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      showSnackbar(context: context, content: e.toString());
    }
  }

  void saveDataToFirestore(
      {required BuildContext context,
      required String name,
      required ProviderRef ref,
      required File? profilePic}) async {
    try {
      String uid = auth.currentUser!.uid;
      String photoURL =
          'https://w7.pngwing.com/pngs/129/292/png-transparent-female-avatar-girl-face-woman-user-flat-classy-users-icon-thumbnail.png';
      if (profilePic != null) {
        photoURL = await ref
            .read(commonFBstorageRepoProvider)
            .storeFileToFirebase('profilePic/$uid', profilePic);
      }

      var user = UserModel(
          name: name,
          uid: uid,
          profilePic: photoURL,
          isOnline: true,
          phonenumber: auth.currentUser!.uid,
          groupId: []);

      await firestore.collection('users').doc(uid).set(user.toMap());

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MobileLayoutScreen()),
          (route) => false);
    } catch (e) {
      showSnackbar(context: context, content: e.toString());
    }
  }
}
