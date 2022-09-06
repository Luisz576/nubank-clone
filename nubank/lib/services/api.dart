import 'package:nubank/models/user.dart';
import 'package:nubank/models/user_data.dart';

class Api{

  static User? _user;
  static User? get user => _user;

  static Future<User?> getUserByToken(String token) async{
    await Future.delayed(const Duration(milliseconds: 600));
    _user = User("id_user_398r3249847934", "User", token);
    return _user;
  }

  static Future<UserData?> getUserData() async{
    if(_user != null){
      await Future.delayed(const Duration(milliseconds: 600));
      return UserData(
        automaticDebitActive: true,
        cardLimit: 200,
        invoice: 55,
        totalCash: 400.2
      );
    }
    return null;
  }

}