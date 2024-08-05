class Order {
  String? id;
  String? customerName;
  int? totalprice;
  int? quantity;
  DateTime? date;
  int? status;

  Order(
      {this.id,
      this.customerName,
      this.totalprice,
      this.quantity,
      this.date,
      this.status});

  // You might want to add a factory constructor for JSON deserialization
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['_id'] as String?,
      customerName: json['customerName'] as String?,
      totalprice: json['totalPrice'] != null
          ? int.tryParse(json['totalPrice'].toString())
          : null,
      quantity: (json['quantity'] as num?)?.toInt(),
      date:
          json['date'] != null ? DateTime.parse(json['date'] as String) : null,
      status: (json['status'] as num?)?.toInt(),
    );
  }

  // You might want to add a method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'customerId': customerName,
      'totalprice': totalprice,
      'quantity': quantity,
      'date': date,
      'status': status
    };
  }
}
