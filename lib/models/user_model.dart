class UserModel {
  String username;
  String password;
  String cpassword;
  String email;
  String address;
  String phoneNumber;
  String uid;
  String name;
  String age;

  UserModel({
    required this.username,
    required this.password,
    required this.cpassword,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.uid,
    required this.name,
    required this.age,
  });

  // from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      cpassword: map['confpassword'] ?? '',
      email: map['email'] ?? '',
      address: map['address'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      uid: map['uid'] ?? '',
      name : map['name'] ?? '',
      age: map['age'] ?? '',
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "password": password,
      "confpassword": cpassword,
      "email": email,
      "address": address,
      "phoneNumber": phoneNumber,
      "uid": uid,
      "name":name,
      "age":age
    };
  }
}
