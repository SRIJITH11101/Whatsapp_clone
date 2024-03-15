import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commonFBstorageRepoProvider = Provider(
  (ref) => commonFBstorageRepo(
    firebaseStorage: FirebaseStorage.instance,
  ),
);

class commonFBstorageRepo {
  final FirebaseStorage firebaseStorage;

  commonFBstorageRepo({required this.firebaseStorage});

  Future<String> storeFileToFirebase(String ref, File file) async {
    UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snap = await uploadTask;
    String downloadURL = await snap.ref.getDownloadURL();
    return downloadURL;
  }
}
