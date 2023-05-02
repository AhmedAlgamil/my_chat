class Data {
  Data({
      this.id, 
      this.fullName, 
      this.phoneNumber, 
      this.isActive, 
      this.imageUrl,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];
    isActive = json['is_active'];
    imageUrl = json['image_url'];
  }
  String? id;
  String? fullName;
  String? phoneNumber;
  String? isActive;
  String? imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['full_name'] = fullName;
    map['phone_number'] = phoneNumber;
    map['is_active'] = isActive;
    map['image_url'] = imageUrl;
    return map;
  }

}