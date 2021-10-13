import 'package:flutter_todolist_provider/app/core/notifier/default_change_notifier.dart';
import 'package:flutter_todolist_provider/app/core/ui/messages.dart';
import 'package:flutter_todolist_provider/app/exception/auth_exceptions.dart';
import 'package:flutter_todolist_provider/app/services/user/user_service.dart';

class LoginController extends DefaultChangeNotifier {
  final UserService _userService;
  String? infoMessage;

  LoginController({required UserService userService})
      : _userService = userService;

  bool get hasInfo => infoMessage != null;

  Future<void> login(String email, String password) async {
    try {
      showLoadingAndResetState();
      infoMessage = null;
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

  Future<void> forgotPasswor(String email) async {
    try {
      showLoadingAndResetState();
      infoMessage = null;
      notifyListeners();
      await _userService.forgotPassword(email);
      infoMessage = 'Reset de senha enviado para seu e-mail';
    } on AuthExceptions catch (e) {
      setError(e.message);
    } catch (e) {
      setError('Erro ao restar a senha');
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  Future<void> googleLogin() async {
    try {
      showLoadingAndResetState();
      infoMessage = null;
      notifyListeners();
      final user = _userService.googleLogin();
      if (user != null) {
        success();
      } else {
        _userService.logout();
        setError('Erro ao realizar login com Google');
      }
    } on AuthExceptions catch (e) {
      _userService.logout();
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
