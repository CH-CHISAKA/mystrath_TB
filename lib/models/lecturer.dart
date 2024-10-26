class Lecturer {
  int id;
  String email;
  String name;

  Lecturer({
    required this.email,
    required this.name,
    required this.id,
  });

  // Convert Lecturer instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'id': id,
    };
  }

  // Create Lecturer instance from JSON
  factory Lecturer.fromJson(Map<String, dynamic> json) {
    return Lecturer(
      email: json['email'],
      name: json['name'],
      id: json['id'],
    );
  }
}
