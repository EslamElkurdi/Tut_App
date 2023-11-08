import 'package:flutter/material.dart';
import 'package:tut_app/presentation/login/view_model/login_viewmodel.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final LoginViewModel _viewModel = LoginViewModel();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();


  _bind(){
    _viewModel.start(); // tell view model, start ur job
    _userNameController.addListener(() => _viewModel.setUserName(_userNameController.text) );
    _userPasswordController.addListener(() => _viewModel.setPassword(_userPasswordController.text) );
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }


  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
