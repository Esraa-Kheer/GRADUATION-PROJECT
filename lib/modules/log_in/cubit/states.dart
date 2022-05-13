import 'package:e_guide/models/login_model/login_model.dart';

abstract class AppLoginStates{}

class AppLoginInitialState extends AppLoginStates{}

class AppLoginLoadingState extends AppLoginStates{}

class AppLoginSuccessState extends AppLoginStates{
  late AppLoginModel loginModel;
  AppLoginSuccessState(this.loginModel);
}

class AppLoginErrorState extends AppLoginStates{
  final String error;
  AppLoginErrorState(this.error);
}

class AppLoginChangePasswordVisibilityState extends AppLoginStates{}
