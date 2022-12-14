import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {
        required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.imageUrl,
        this.isFavorite = false
      }
  );

  void _setFavValue (bool newValue){
    isFavorite = newValue;
    notifyListeners();
  }

  Future<void> toggelFavotiteStatus() async{
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    try{
      Uri url = Uri.parse(
          'https://flutter-practice-f96f3-default-rtdb.firebaseio.com/products/$id.json');
      final response = await http.patch(url,body: json.encode({
        'isFavorite': isFavorite,
      }));
      if(response.statusCode >= 400){
        _setFavValue(oldStatus);
      }
    }catch(error){
      print(error);
      _setFavValue(oldStatus);
    }
  }
}
