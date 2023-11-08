import 'dart:async';

import 'package:tut_app/domain/usecase/login_usecase.dart';
import 'package:tut_app/presentation/base/base_view_model.dart';
import 'package:tut_app/presentation/common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel implements LoginViewModelInputs, LoginViewModelOutputs {

  final StreamController _userNameStreamController = StreamController<String>.broadcast();
  final StreamController _passwordStreamController = StreamController<String>.broadcast();

  final StreamController _areAllInputsValidStreamController = StreamController<void>.broadcast();


  var loginObject = LoginObject("", "");

  late LoginUseCase _loginUseCase;
  
  // inputs
  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
    _areAllInputsValidStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override

  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;


  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    inputAreAllInputsValid.add(null);
  }

  @override
  setUserName(String username) {
    inputUserName.add(username);
    loginObject = loginObject.copyWith(userName: username);
    inputAreAllInputsValid.add(null);
  }

  @override
  login() async {
    (await _loginUseCase.execute(
      LoginUseCaseInput(loginObject.userName, loginObject.password)
      )
    ).fold(
            (failure) {
              print(failure.message);
            },
            (data) {
              print(data.customer?.name);
            });
  }


  // outputs
  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream.map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outIsUserNameValid => _userNameStreamController.stream.map((userName) => _isUserNameValid(userName));

  @override
  Stream<bool> get outAreAllInputsValid => _areAllInputsValidStreamController.stream.map((_) => _areAllInputsValid());


  bool _isPasswordValid(String password){
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName){
    return userName.isNotEmpty;
  }

  bool _areAllInputsValid(){
    return _isUserNameValid(loginObject.userName) && _isPasswordValid(loginObject.password);
  }


}

abstract class LoginViewModelInputs{
  setUserName(String username);
  setPassword(String password);
  login();

  Sink get inputUserName;

  Sink get inputPassword;

  Sink get inputAreAllInputsValid;
}

abstract class LoginViewModelOutputs{
  Stream<bool> get outIsUserNameValid;

  Stream<bool> get outIsPasswordValid;

  Stream<bool> get outAreAllInputsValid;

}

