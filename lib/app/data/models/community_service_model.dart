import 'package:equatable/equatable.dart';

class CommunityService extends Equatable {
  CommunityService({
    this.name,
    this.data,
  });

  String name;
  List<CommunityServiceData> data;

  factory CommunityService.fromJson(Map<String, dynamic> json) =>
      CommunityService(
        name: json["name"],
        data: List<CommunityServiceData>.from(
            json["data"].map((x) => CommunityServiceData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "data": data != null
            ? List<dynamic>.from(data.map((x) => x.toJson()))
            : null,
      };

  @override
  List<Object> get props => [name, data];
}

class CommunityServiceData extends Equatable {
  CommunityServiceData({
    this.name,
    this.address,
    this.phone,
    this.fax,
    this.email,
    this.category,
  });

  String name;
  String address;
  String phone;
  String fax;
  String email;
  String category;

  factory CommunityServiceData.fromJson(Map<String, dynamic> json) =>
      CommunityServiceData(
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        fax: json["fax"],
        email: json["email"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "phone": phone,
        "fax": fax,
        "email": email,
        "category": category,
      };

  @override
  List<Object> get props => [name, address, phone, fax, email, category];
}
