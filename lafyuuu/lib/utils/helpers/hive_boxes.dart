import 'package:hive/hive.dart';

class HiveBoxes {
  static late Box<String> _emailBox;
  static late Box<String> _passwordBox;

  static Future<void> init() async {
    await Hive.openBox<String>('email_box').then((box) => _emailBox = box);
    await Hive.openBox<String>('password_box').then((box) => _passwordBox = box);
  }

  static Future<void> saveEmail(String email) async {
    await _emailBox.put('email_key', email);
  }

  

  static Future<void> savePassword(String password) async {
    await _passwordBox.put('password_key', password);
  }

  
}