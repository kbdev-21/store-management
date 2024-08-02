class Country {
  String name;
  String flagUrl;
  
  Country({required this.name, required this.flagUrl});

  // You might want to add a factory constructor for JSON deserialization
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      flagUrl: json['flag'],
    );
  }

  // You might want to add a method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'flag': flagUrl,
    };
  }
}