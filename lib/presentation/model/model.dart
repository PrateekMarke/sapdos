import 'dart:convert';

class User {
  final String greeting;
  final String name;
  final String avatar;

  User({required this.greeting, required this.name, required this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      greeting: json['greeting'],
      name: json['name'],
      avatar: json['avatar'],
    );
  }
}

class Doctor {
  final String doctorImage;
  final String doctorName;
  final String specialization;
  final int price;

  Doctor({required this.doctorImage, required this.doctorName, required this.specialization, required this.price});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      doctorImage: json['doctorImage'],
      doctorName: json['doctorName'],
      specialization: json['specialization'],
      price: json['price'],
    );
  }
}

class DoctorListResponse {
  final User user;
  final List<Doctor> doctorsList;

  DoctorListResponse({required this.user, required this.doctorsList});

  factory DoctorListResponse.fromJson(Map<String, dynamic> json) {
    var list = json['doctorsList'] as List;
    List<Doctor> doctorsList = list.map((i) => Doctor.fromJson(i)).toList();

    return DoctorListResponse(
      user: User.fromJson(json['user']),
      doctorsList: doctorsList,
    );
  }
}
