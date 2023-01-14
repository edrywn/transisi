import 'package:transisi/data/model/auth_model.dart';
import 'package:transisi/data/service/auth_service.dart';

class AuthRepository {
  final authService = AuthService();

  Future<AuthModel> login(String? email, String? password) {
    return authService.login(email, password);
  }
}
