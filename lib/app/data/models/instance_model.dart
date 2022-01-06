import 'package:equatable/equatable.dart';

class BaseInstance extends Equatable {
  BaseInstance({
    this.name,
    this.data,
  });

  final String name;
  final List<InstanceData> data;

  factory BaseInstance.fromJson(Map<String, dynamic> json) {
    return BaseInstance(
      name: json["name"],
      data: List<InstanceData>.from(
        json["data"].map((x) => InstanceData.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }

  @override
  List<Object> get props => [name, data];
}

class InstanceData extends Equatable {
  InstanceData({
    this.name,
    this.address,
    this.phone,
    this.fax,
    this.email,
    this.category,
  });

  final String name;
  final String address;
  final String phone;
  final String fax;
  final String email;
  final String category;

  factory InstanceData.fromJson(Map<String, dynamic> json) {
    return InstanceData(
      name: json["name"],
      address: json["address"],
      phone: json["phone"],
      fax: json["fax"],
      email: json["email"],
      category: json["category"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "address": address,
      "phone": phone,
      "fax": fax,
      "email": email,
      "category": category,
    };
  }

  @override
  List<Object> get props => [name, address, phone, fax, email, category];
}
