class Course {
  String name;
  String id;

  Course({required this.name, required this.id});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      name: json['name'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
    };
  }
}