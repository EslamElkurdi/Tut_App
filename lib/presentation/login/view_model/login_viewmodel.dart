import 'dart:async';

import 'package:tut_app/presentation/base/base_view_model.dart';

class LoginViewModel extends BaseViewModel implements LoginViewModelInputs, LoginViewModelOutputs {

  final StreamController _userNameStreamController = StreamController<String>.broadcast();
  final StreamController _passwordStreamController = StreamController<String>.broadcast();


  // inputs
  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  // TODO: implement inputUserName
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  setPassword(String password) {
    inputPassword.add(password);
  }

  @override
  setUserName(String username) {
    inputUserName.add(username);
  }

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }


  // outputs
  @override
  // TODO: implement outIsPasswordValid
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream.map((password) => _isPasswordValid(password));

  @override
  // TODO: implement outIsUserNameValid
  Stream<bool> get outIsUserNameValid => _userNameStreamController.stream.map((userName) => _isUserNameValid(userName));

  bool _isPasswordValid(String password){
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName){
    return userName.isNotEmpty;
  }

}

abstract class LoginViewModelInputs{
  setUserName(String username);
  setPassword(String password);
  login();

  Sink get inputUserName;
  Sink get inputPassword;
}

abstract class LoginViewModelOutputs{
  Stream<bool> get outIsUserNameValid;
  Stream<bool> get outIsPasswordValid;
}

