import 'dart:collection';

import 'package:e_guide/layout/cubit/cubit.dart';
import 'package:e_guide/layout/cubit/states.dart';
import 'package:e_guide/modules/get_cafes_by_city-id/get_cafes_by_city-id.dart';
import 'package:e_guide/modules/get_clubs_by_city_id/get_clubs_by_city_id.dart';
import 'package:e_guide/modules/get_hotels_by_city_id/get_hotels_by_city_id.dart';
import 'package:e_guide/modules/get_restaurants_by_city_id/get_restaurants_by_city_id.dart';
import 'package:e_guide/modules/get_tourist_places_by_city_id/get_tourist_places_by_city_id.dart';
import 'package:e_guide/modules/map/map_screen.dart';
import 'package:e_guide/modules/restaurant_item/restaurant_item.dart';
import 'package:e_guide/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CityInfoScreen extends StatelessWidget {
 // const CityInfoScreen({Key? key}) : super(key: key);

  late dynamic pic;
  late dynamic name;
  late dynamic area;
  late dynamic population;
  late dynamic aboutTheCity;
  late dynamic lng;
  late dynamic lat;
  late dynamic id;

  CityInfoScreen({
    required this.pic,
    required this.name,
    required this.area,
    required this.population,
    required this.aboutTheCity,
    required this.lng,
    required this.lat,
    required this.id,

  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(),
            body:SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20,left: 20,top: 20),
                    child: SingleChildScrollView(
                      scrollDirection:Axis.horizontal,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                child: Container(
                                  height: 60,
                                  width: 100,
                                  //color: Colors.white,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.black12,
                                      //width: 5
                                    ),
                                  ),

                                  child: Column(
                                    children: [
                                      Icon(Icons.restaurant_menu,color: Colors.teal,),
                                      Text('Restaurants',style: TextStyle(color: Colors.teal),),
                                    ],
                                  ),
                                ),
                                onTap: ()async{
                                  await AppCubit.get(context).getRestaurants(id);
                                  navigateTo(context, GetResturants());

                                },
                              ),
                              SizedBox(width: 10,),
                              GestureDetector(
                                child: Container(
                                  height: 60,
                                  width: 100,
                                  //color: Colors.white,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.black12,
                                      //width: 5
                                    ),
                                  ),

                                  child: Column(
                                    children: [
                                      Icon(Icons.free_breakfast_outlined,color: Colors.teal,),
                                      Text('Cafe',style: TextStyle(color: Colors.teal),),
                                    ],
                                  ),
                                ),
                                onTap: ()async{
                                  await AppCubit.get(context).getCafes(id);
                                  navigateTo(context, GetCafes());

                                },
                              ),
                              SizedBox(width: 10,),
                              GestureDetector(
                                child: Container(
                                  height: 60,
                                  width: 100,
                                  //color: Colors.white,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.black12,
                                      //width: 5
                                    ),
                                  ),

                                  child: Column(
                                    children: [
                                      Icon(Icons.business_outlined,color: Colors.teal,),
                                      Text('Hotels',style: TextStyle(color: Colors.teal),),
                                    ],
                                  ),
                                ),
                                onTap: ()async{
                                  await AppCubit.get(context).getHotels(id);
                                  navigateTo(context, GetHotels());

                                },
                              ),
                              SizedBox(width: 10,),
                              GestureDetector(
                                child: Container(
                                  height: 60,
                                  width: 100,
                                  //color: Colors.white,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.black12,
                                      //width: 5
                                    ),
                                  ),

                                  child: Column(
                                    children: [
                                      Icon(Icons.family_restroom,color: Colors.teal,),
                                      Text('Clubs',style: TextStyle(color: Colors.teal),),
                                    ],
                                  ),
                                ),
                                onTap: ()async{
                                  await AppCubit.get(context).getClubs(id);
                                  navigateTo(context, GetClubs());

                                },
                              ),
                              SizedBox(width: 10,),
                              GestureDetector(
                                child: Container(
                                  height: 60,
                                  width: 100,
                                  //color: Colors.white,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.black12,
                                      //width: 5
                                    ),
                                  ),

                                  child: Column(
                                    children: [
                                      Icon(Icons.festival_sharp ,color: Colors.teal,),
                                      Text('Musuems',style: TextStyle(color: Colors.teal),),
                                    ],
                                  ),
                                ),
                                onTap: ()async{
                                  await AppCubit.get(context).getTouristPlacee(id);
                                  navigateTo(context, GetTouritPlaces());
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                         border: Border.all(
                           color: Colors.black12,
                           width: 2
                         ),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Image(
                                image: NetworkImage(pic)
                            ),
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                Text(
                                  name,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.teal,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.teal,
                                  ),
                                  child: IconButton(
                                    splashRadius: 200,
                                    icon: const Icon(Icons.pin_drop_outlined,color: Colors.white,),
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>  MapScreen(lat,lng)),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Area : ',
                                  style:TextStyle(
                                    fontSize: 20,
                                    color: Colors.teal,
                                  ) ,),
                                Text(area,
                                  style: TextStyle(
                                      fontSize: 16
                                  ),),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 10),
                              child: myDivider(),
                            ),
                            Row(
                              children: [
                                Text('Population : ',
                                  style:TextStyle(
                                    fontSize: 20,
                                    color: Colors.teal,
                                  ) ,),
                                Text(population,
                                  style: TextStyle(
                                      fontSize: 16
                                  ),),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 10),
                              child: myDivider(),
                            ),
                            Text('About the city : ',
                            style:TextStyle(
                              fontSize: 20,
                              color: Colors.teal,
                            ) ,
                            ),
                            Text(
                              aboutTheCity,
                              style: TextStyle(
                                fontSize: 16
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
        );
      },

    );
  }
}

