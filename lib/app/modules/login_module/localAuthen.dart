import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthen{
  var auth = LocalAuthentication();

  Future<bool> checkBiometrics() async {
     bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    return canCheckBiometrics;
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
     List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
     print(availableBiometrics);
   return availableBiometrics;
  }

  Future<bool> authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
       localizedReason: 'Lưạ chọn phương thức đăng nhập',
          useErrorDialogs: true,
          stickyAuth: true);
    } on PlatformException catch (e) {
      print(e);

      return false;
    }
    return authenticated;
  }

  Future<bool> authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
          localizedReason:
          'Xác thực đăng nhập bằng FaceID',
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true);

    } on PlatformException catch (e) {
      print(e);

      return false;
    }
    return authenticated;
  }
}