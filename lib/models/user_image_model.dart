
class UserImageModel {
  String profilePic;
  String createdAt;
  String phoneNumber;

  UserImageModel({
    required this.profilePic,
    required this.createdAt,
    required this.phoneNumber,
  });

  // from map
  factory UserImageModel.fromMap(Map<String, dynamic> map) {
    return UserImageModel(
      phoneNumber: map['phoneNumber'] ?? '',
      profilePic: map['profilePic'] ?? '',
      createdAt: map['createdAt'] ?? '',
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "profilePic": profilePic,
      "createdAt": createdAt,
      "phoneNumber": phoneNumber,
    };
  }
}
