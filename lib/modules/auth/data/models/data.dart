class Data {
  Data({
    this.id = "",
    this.fullName = "",
    this.phoneNumber = "",
    this.email = "",
    this.password = "",
    this.isActive = "",
    this.imageUrl = "",
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    password = json['password'];
    isActive = json['is_active'];
    imageUrl = json['image_url'];
  }

  String? id = "";
  String? fullName = "";
  String? phoneNumber = "";
  String? email = "";
  String? password = "";
  String? isActive = "";
  String? imageUrl = "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['full_name'] = fullName;
    map['phone_number'] = phoneNumber;
    map['email'] = email;
    map['password'] = password;
    map['is_active'] = isActive;
    map['image_url'] = imageUrl;
    return map;
  }
}
