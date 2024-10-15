class User {
  String? name;
  int? age;

  User({this.name, this.age});

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'] as String?,
        age: json['age'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
      };
}
