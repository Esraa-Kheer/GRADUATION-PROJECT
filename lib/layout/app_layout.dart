import 'package:e_guide/layout/cubit/cubit.dart';
import 'package:e_guide/layout/cubit/states.dart';
import 'package:e_guide/models/city_model/city_model.dart';
import 'package:e_guide/modules/favorite/favorite_screen.dart';
import 'package:e_guide/modules/home/home_screen.dart';
import 'package:e_guide/modules/log_in/log_in_screen.dart';
import 'package:e_guide/modules/offers/offers_screen.dart';
import 'package:e_guide/modules/profile/profile_screen.dart';
import 'package:e_guide/modules/search/search_screen.dart';
import 'package:e_guide/shared/components/components.dart';
import 'package:e_guide/shared/network/local/cashe_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit=AppCubit.get(context);
        return Scaffold(
          drawer: Drawer(
            elevation: .9,
            child: ListView(
              children: [
                Container(
                  color: Colors.teal.shade600,
                  child: const ListTile(
                    leading: Icon(Icons.menu_sharp,color: Colors.white,size: 30,),
                    title:  Text(
                      "E_GUIDE",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800
                      ),

                    ),
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.teal,
            actions: [
              IconButton(
                onPressed: (){
                  navigateTo(context, SearchScreen());
                },
                icon: Icon(Icons.search),
                color: Colors.white,
              ),

            ],
          ),
          body:cubit.bottomScreens[cubit.currentIndex] ,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            //backgroundColor: Colors.teal,
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottom(index);
            },
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label:'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label:'Favourits',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.label),
                label:'Offer',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label:'Profile',
              ),
            ],
          ),

        );
      }
    );
  }
}