import 'package:e_guide/layout/cubit/cubit.dart';
import 'package:e_guide/models/city_model/city_model.dart';
import 'package:e_guide/modules/log_in/log_in_screen.dart';
import 'package:e_guide/shared/bloc_observer.dart';
import 'package:e_guide/shared/network/local/cashe_helper.dart';
import 'package:e_guide/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/app_layout.dart';
import 'modules/on_boarding/on_boarding_screen.dart';
import 'modules/splash/spalsh_screen.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();
  DioHelper.init();
   await CasheHelper.init();
   Widget widget;
   dynamic onBoarding = CasheHelper.getData(key: 'onBoarding');
   dynamic token = CasheHelper.getData(key: 'token');

   if(onBoarding!=null){
     if(token!=null) widget=HomeLayout();
     else widget=LogInScreen();
   }else{
     widget=OnBoardingScreen();
   }

  runApp(  MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool? onBoarding;
 final Widget? startWidget;
MyApp({
  this.onBoarding,
    this.startWidget
});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AppCubit()..getCities(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        debugShowCheckedModeBanner: false,
        home: startWidget,
      ),
    );
  }
}
