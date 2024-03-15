import 'package:json_serializable/json_serializable.dart';
import 'package:json_annotation/json_annotation.dart';

class UserModel {
  final String name;
  final String uid;
  final String profilePic;
  final bool isOnline;
  final String phonenumber;
  final List<String> groupId;

  UserModel(
      {required this.name,
      required this.uid,
      required this.profilePic,
      required this.isOnline,
      required this.phonenumber,
      required this.groupId});
}
