import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

class Apiservice {
  final String apiKey;

  Apiservice() : apiKey = dotenv.env["clientId"] ?? "null";

  String generateRandomString(int length) {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final rnd = Random();
  return List.generate(length, (_) => chars[rnd.nextInt(chars.length)]).join();
}


  void login(){
   final String state =  generateRandomString(16);
    http.get(Uri.parse("https://accounts.spotify.com/authorize?"))
  }
}
