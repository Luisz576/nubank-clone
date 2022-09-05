import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class Auth{

  static final _auth = LocalAuthentication();
  static int _canCheckBiometrics = 0; // 0 - need get / 1 - can / 2 - can't

  static Future<bool> canCheckBiometrics() async{
    if(_canCheckBiometrics != 0){
      return _canCheckBiometrics == 1;
    }
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await _auth.canCheckBiometrics;
      canCheckBiometrics = canCheckBiometrics || await _auth.isDeviceSupported();
    } on PlatformException catch (_) {
      canCheckBiometrics = false;
    }
    _canCheckBiometrics = canCheckBiometrics ? 1 : 2;
    return canCheckBiometrics;
  }

  static Future<bool> tryAuth() async{
    if(await canCheckBiometrics()){
      return await _auth.authenticate(
        localizedReason: 'Por favor, autentique-se para acessa o app!'
      );
    }
    return false;
  }

}