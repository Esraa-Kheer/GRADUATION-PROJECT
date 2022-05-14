import 'package:bloc/bloc.dart';
import 'package:e_guide/layout/cubit/states.dart';
import 'package:e_guide/models/city_model/city_model.dart';
import 'package:e_guide/models/login_model/login_model.dart';
import 'package:e_guide/modules/favorite/favorite_screen.dart';
import 'package:e_guide/modules/home/home_screen.dart';
import 'package:e_guide/modules/offers/offers_screen.dart';
import 'package:e_guide/modules/profile/profile_screen.dart';
import 'package:e_guide/shared/components/constants.dart';
import 'package:e_guide/shared/network/end_points.dart';
import 'package:e_guide/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());

  static AppCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;
  List<Widget> bottomScreens=[
    HomeScreen(),
    FavoriteScreen(),
    OffersScreen(),
    ProfileScreen(),
  ];
void changeBottom(int index){
  currentIndex=index;
  emit(AppChangeBottomBavState());
}

  //late CitiesModel citiesModel;
  CitiesModel? citiesModel;
  void getCities() {
    emit(AppLoadingCitiesState());

    DioHelper.getData(
      
      url: CITY,
      //id: id,
      token: token,
    ).then((value) {
      citiesModel = CitiesModel.fromJson(value.data);
      print(citiesModel!.status);
      printFullText(citiesModel!.data[0].name.toString());

      emit(AppSuccessCitiesState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorCitiesState());
    });
  }


    late AppLoginModel userModel;

  void getUserData() {
    emit(AppLoadingUserDataState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      print(token.toString());
      userModel = AppLoginModel.fromJson(value.data);
      printFullText(userModel.data.name);

      emit(AppSuccessUserDataState(userModel));
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorUserDataState());
    });
  }



}