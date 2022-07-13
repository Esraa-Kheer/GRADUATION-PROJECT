import 'package:e_guide/models/login_model/login_model.dart';

abstract class AppStates{}

class AppInitialState extends AppStates{}

class AppChangeBottomBavState extends AppStates{}
////////////////////////////////////////////////////////////
class AppLoadingCitiesState extends AppStates{}

class AppSuccessCitiesState extends AppStates{}

class AppErrorCitiesState extends AppStates{}

////////////////////////////////////////////////////////////
class AppLoadingRestaurantsState extends AppStates{}

class AppSuccessRestaurantsState extends AppStates{}

class AppErrorRestaurantsState extends AppStates{}
////////////////////////////////////////////////////////////
class AppLoadingCafesState extends AppStates{}

class AppSuccessCafesState extends AppStates{}

class AppErrorCafesState extends AppStates{}
////////////////////////////////////////////////////////////
class AppLoadingHotelsState extends AppStates{}

class AppSuccessHotelsState extends AppStates{}

class AppErrorHotelsState extends AppStates{}
////////////////////////////////////////////////////////////
class AppLoadingClubsState extends AppStates{}

class AppSuccessClubsState extends AppStates{}

class AppErrorClubsState extends AppStates{}
/////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
class AppLoadingTouristPlacesState extends AppStates{}

class AppSuccessTouristPlacesState extends AppStates{}

class AppErrorTouristPlacesState extends AppStates{}
/////////////////////////////////////////////////////////////
class AppLoadingHomeDataState extends AppStates{}

class AppSuccessHomeDataState extends AppStates{}


class AppErrorHomeDataState extends AppStates{}

////////////////////////////////////////////////////////////
class AppLoadingUserDataState extends AppStates{}

class AppSuccessUserDataState extends AppStates{
  final AppLoginModel loginModel;
  AppSuccessUserDataState(this.loginModel);
}

class AppErrorUserDataState extends AppStates{}
///////////////////////////////////////////////////////////
class AppSuccessChangeFavoriteState extends AppStates{}

class AppErrorChangeFavoriteState extends AppStates{}
