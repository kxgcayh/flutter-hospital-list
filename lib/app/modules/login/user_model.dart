import 'package:equatable/equatable.dart';

class User extends Equatable {
  int? phone;
  String? email;

  User({this.phone, this.email});

  User.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['phone'] = phone;
    data['email'] = email;
    return data;
  }

  @override
  List<Object?> get props => [phone, email];
}
