class UsersResponse {
  final List<User> users;
  final Support support;

  UsersResponse({required this.users, required this.support});

  factory UsersResponse.fromJson(Map<String, dynamic> json) {
    List<User> users = (json['data'] as List)
        .map((userJson) => User.fromJson(userJson))
        .toList();

    return UsersResponse(
      users: users,
      support: Support.fromJson(json['support']),
    );
  }
}

class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}

class Support {
  final String url;
  final String text;

  Support({required this.url, required this.text});

  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(
      url: json['url'],
      text: json['text'],
    );
  }
}