import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  Support({
    required this.url,
    required this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(
      url: json['url'],
      text: json['text'],
    );
  }
}

class UserDataProvider with ChangeNotifier {
  List<User> _users = [];
  Support? _support;
  bool _isLoading = false;

  List<User> get users => _users;
  Support? get support => _support;
  bool get isLoading => _isLoading;

  UserDataProvider() {
    _fetchData();
  }

  Future<void> _fetchData() async {
    _isLoading = true;
    notifyListeners();

    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      final List<dynamic> usersJson = parsed['data'];
      _users = usersJson.map((json) => User.fromJson(json)).toList();
      _support = Support.fromJson(parsed['support']);
      _isLoading = false;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
