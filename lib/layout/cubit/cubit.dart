
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_guide/layout/cubit/states.dart';
import 'package:e_guide/models/cafes_model/cafes_model.dart';
import 'package:e_guide/models/change_favorite_model/change_favorite_model.dart';
import 'package:e_guide/models/city_model/city_model.dart';
import 'package:e_guide/models/club_model/club_model.dart';
import 'package:e_guide/models/home_model/home_model.dart';
import 'package:e_guide/models/home_model/home_model.dart';
import 'package:e_guide/models/hotels_model/hotels_model.dart';
import 'package:e_guide/models/login_model/login_model.dart';
import 'package:e_guide/models/restaurants_model/restaurants_model.dart';
import 'package:e_guide/models/tourist_places_model/tourist_place_model.dart';
import 'package:e_guide/modules/city_info/city_info.dart';
import 'package:e_guide/modules/favorite/favorite_screen.dart';
import 'package:e_guide/modules/home/home_screen.dart';
import 'package:e_guide/modules/log_in/cubit/cubit.dart';
import 'package:e_guide/modules/offers/offers_screen.dart';
import 'package:e_guide/modules/profile/profile_screen.dart';
import 'package:e_guide/shared/components/constants.dart';
import 'package:e_guide/shared/network/end_points.dart';
import 'package:e_guide/shared/network/local/cashe_helper.dart';
import 'package:e_guide/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());

  static AppCubit get(context)=>BlocProvider.of(context);

  late bool in_favorites=false;
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
////////////////////////////////////////////////////////////////
  HomeModel? homeModel;
void getHomeData(){
  emit(AppLoadingHomeDataState());
  DioHelper.getData(
      url: Home,
    token:token,
  ).then((value) {
    homeModel=HomeModel.fromJson(value.data);

    emit(AppSuccessHomeDataState());
  }).catchError((error){
    print(error.toString());
    emit(AppErrorHomeDataState());
  });
}

//////////////////////////////////////////////////////////////////
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
/////////////////////////////////////////////
   Map WishList={};
  //////////////////////////////////////////////////////////////////
  RestaurantsModel? restaurantsModel;
  CityInfoScreen? cityInfoScreen;
  //var cityId=cityInfoScreen.id;
  Future? getRestaurants(String id) {
    emit(AppLoadingRestaurantsState());

    DioHelper.getData(

      url: '$RESTAURANTS/$id',
      //id: id,
      token: token,
    ).then((value) {
      restaurantsModel = RestaurantsModel.fromJson(value.data);
      print(restaurantsModel!.status);
      printFullText(restaurantsModel!.data![2].name.toString());

      restaurantsModel!.data!.forEach((element) {
        WishList.addAll({
          element.id:element.inWishList,
        });
      });
      print(WishList.toString());
      emit(AppSuccessRestaurantsState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorRestaurantsState());
    });
  }
//////////////////////////////////////////////////////////////////////////////////////
  CafesModel? cafesModel;
  //var cityId=cityInfoScreen.id;
  Future? getCafes(String id) {
    emit(AppLoadingCafesState());
    DioHelper.getData(
      url: '$CAFES/$id',
      //id: id,
      token: token,
    ).then((value) {
      cafesModel = CafesModel.fromJson(value.data);
      print(cafesModel!.status);
      printFullText(cafesModel!.data![2].name.toString());
      emit(AppSuccessCafesState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorCafesState());
    });
  }
  //////////////////////////////////////////////////////////////////////////////////////
  HotelModel? hotelModel;
  //var cityId=cityInfoScreen.id;
  Future? getHotels(String id) {
    emit(AppLoadingHotelsState());
    DioHelper.getData(
      url: '$HOTELS/$id',
      //id: id,
      token: token,
    ).then((value) {
      hotelModel = HotelModel.fromJson(value.data);
      print(hotelModel!.status);
      printFullText(hotelModel!.data![2].name.toString());
      emit(AppSuccessHotelsState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorHotelsState());
    });
  }
  //////////////////////////////////////////////////////////////////////////////////////
  ClubModel? clubModel;
  //var cityId=cityInfoScreen.id;
  Future? getClubs(String id) {
    emit(AppLoadingClubsState());
    DioHelper.getData(
      url: '$CLUBS/$id',
      //id: id,
      token: token,
    ).then((value) {
      clubModel = ClubModel.fromJson(value.data);
      print(clubModel!.status);
      emit(AppSuccessClubsState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorClubsState());
    });
  }
  //////////////////////////////////////////////////////////////////////////////////////
  TourisPlacetModel? tourisPlacetModel;
  Future? getTouristPlacee(String id) {
    emit(AppLoadingClubsState());
    DioHelper.getData(
      url: '$TOURISTPLACES/$id',
      //id: id,
      token: token,
    ).then((value) {
      tourisPlacetModel = TourisPlacetModel.fromJson(value.data);
      print(tourisPlacetModel!.status);
      emit(AppSuccessClubsState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorClubsState());
    });
  }
//////////////////////////////////////////////////////////////////////////////////////
  AppLoginModel? userModel;
  late BuildContext context;
  var savedToken=CasheHelper.getData(key: 'Authorization');
  void getUserData() {
    emit(AppLoadingUserDataState());
     DioHelper.getData(
      url: PROFILE,
      token: savedToken,
    ).then((value)
     {
      userModel = AppLoginModel.fromJson(value.data);
      print(userModel!.data.token);
      printFullText(userModel!.data.name);
      emit(AppSuccessUserDataState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorUserDataState());
    });
  }
  //////////////////////////////////////////////////////

  late ChangeFavoriteModel changeFavoriteModel;
  Future? changeFavorites(dynamic restaurantId){
    WishList[restaurantId]=!WishList[restaurantId];
    DioHelper.postData(
        url: '$FAVORITES/${userModel!.data.id}',
        data: {
          'restaurantId':restaurantId,
        },
        token: savedToken
    ).then((value) {
      changeFavoriteModel=ChangeFavoriteModel.fromJson(value.data);
      print(value.data);
      emit(AppSuccessChangeFavoriteState());
    }).catchError((error){
      emit(AppErrorChangeFavoriteState());
    });
}
}