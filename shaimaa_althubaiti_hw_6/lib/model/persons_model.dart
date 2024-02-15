class Persons {
  final String name;
  final String email;
  Persons({required this.name, required this.email});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
    };
  }

  factory Persons.fromJson(Map<String, dynamic> json) {
    return Persons(
      name: json["name"],
      email: json["email"],
    );
  }
}
