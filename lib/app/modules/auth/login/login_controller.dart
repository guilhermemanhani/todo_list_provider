import 'package:flutter_todolist_provider/app/core/notifier/default_change_notifier.dart';
import 'package:flutter_todolist_provider/app/exception/auth_exceptions.dart';
import 'package:flutter_todolist_provider/app/services/user/user_service.dart';

class LoginController extends DefaultChangeNotifier {
  final UserService _userService;

  LoginController({required UserService userService})
      : _userService = userService;

  Future<void> login(String email, String password) async {
    try {
      showLoadingAndResetState();
      notifyListeners();
      final user = await _userService.login(email, password);
      if (user != null) {
        success();
      } else {
        setError('Usuário ou senha inválidos');
      }
    } on AuthExceptions catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
