class Customer {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  int? gender;

  Customer({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.gender,
  });

  // You might want to add a factory constructor for JSON deserialization
  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['_id'],
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      gender: json['gender'] ?? '',
    );
  }

  // You might want to add a method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
       '_id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'gender': gender,
    };
  }
}