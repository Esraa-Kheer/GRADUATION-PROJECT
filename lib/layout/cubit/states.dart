import 'package:e_guide/models/login_model/login_model.dart';

abstract class AppStates{}

class AppInitialState extends AppStates{}

class AppChangeBottomBavState extends AppStates{}
////////////////////////////////////////////////////////////
class AppLoadingCitiesState extends AppStates{}

class AppSuccessCitiesState extends AppStates{}

class AppErrorCitiesState extends AppStates{}

////////////////////////////////////////////////////////////
class AppLoadingUserDataState extends AppStates{}

class AppSuccessUserDataState extends AppStates{
  final AppLoginModel loginModel;
  AppSuccessUserDataState(this.loginModel);
}

class AppErrorUserDataState extends AppStates{}