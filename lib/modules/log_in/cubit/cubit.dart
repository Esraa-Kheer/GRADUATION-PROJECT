import 'package:bloc/bloc.dart';
import 'package:e_guide/models/login_model/login_model.dart';
import 'package:e_guide/modules/log_in/cubit/states.dart';
import 'package:e_guide/modules/register/register_screen.dart';
import 'package:e_guide/shared/network/end_points.dart';
import 'package:e_guide/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLoginCubit extends Cubit<AppLoginStates>{
  AppLoginCubit():super(AppLoginInitialState());

  static AppLoginCubit get(context)=>BlocProvider.of(context);

 late AppLoginModel loginModel;
  void userLogin({
  required String email,
    required String password,
}){
    emit(AppLoginLoadingState());
DioHelper.postData(
    url: LOGIN,
    data: {
  'email':email,
  'password':password
}) .then((value){
  //print(value.data);
  loginModel=AppLoginModel.fromJson(value.data);
  print(loginModel.status);
  //(loginModel.data.email);
  emit(AppLoginSuccessState(loginModel));
}).catchError((error){
  print(error.toString());
  emit(AppLoginErrorState(error.toString()));
}); }

  IconData suffix=Icons.visibility_outlined;
  bool isPassword=true;

  void changePasswordVisibility(){
    isPassword=!isPassword;

    suffix=isPassword ? Icons.visibility_outlined:Icons.visibility_off_outlined;

    emit(AppLoginChangePasswordVisibilityState());
  }

  void changeCheckBox(){

  }

}