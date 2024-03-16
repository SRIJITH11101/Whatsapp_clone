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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
      'profilePic': profilePic,
      'isOnline': isOnline,
      'phonenumber': phonenumber,
      'groupId': groupId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name'] as String,
        uid: map['uid'] as String,
        profilePic: map['profilePic'] as String,
        isOnline: map['isOnline'] as bool,
        phonenumber: map['phonenumber'] as String,
        groupId: List<String>.from(
          (map['groupId'] as List<String>),
        ));
  }
}
