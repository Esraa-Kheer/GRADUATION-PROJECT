import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_guide/layout/cubit/cubit.dart';
import 'package:e_guide/layout/cubit/states.dart';
import 'package:e_guide/models/city_model/city_model.dart';
import 'package:e_guide/modules/map/map_screen.dart';
import 'package:e_guide/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

late CitiesModel citiesModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
     listener: (context, state) => (){},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: AppCubit.get(context).citiesModel!=null,
            builder: (context) => HomeBuilder( AppCubit.get(context).citiesModel!),
            fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}


Widget HomeBuilder(CitiesModel citiesModel)=>Scaffold(
    body: SingleChildScrollView(
      child: Column(
       children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70.0),
            child: Row(
              children: [
                Container(

                  child: Flexible(
                    child: ListView(
                      shrinkWrap: true,
                      children:  [
                        ExpansionTile(
                          title: Text(
                            'GOVERNMENT',
                            textAlign: TextAlign.center,
                            style:
                          TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade800,
                          ),
                          ),
                          childrenPadding: EdgeInsets.symmetric(vertical: 0),
                          tilePadding: EdgeInsets.symmetric(vertical:-10),
                          children: citiesModel.data.map((e) => ListTile(
                            title: Text(
                              e.name,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            onTap: (){
                              print("clicked");
                            },
                            leading: Icon(Icons.circle,size: 15,color: Colors.teal,),
                            trailing: Icon(Icons.arrow_forward_ios_outlined,size: 15,),
                            contentPadding: EdgeInsets.symmetric(vertical: -30),
                          ),).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CarouselSlider(
              items: [
                Image.asset('assets/images/Egypt/1.jpeg',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                Image.asset('assets/images/Egypt/2.jpeg',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,),
                Image.asset('assets/images/Egypt/3.jpeg',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,),
                Image.asset('assets/images/Egypt/4.jpeg',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,),
                Image.asset('assets/images/Egypt/5.jpeg',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,),
                Image.asset('assets/images/Egypt/6.jpeg',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,),
                Image.asset('assets/images/Egypt/7.jpeg',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,),
                Image.asset('assets/images/Egypt/8.jpeg',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,),
              ],
              options: CarouselOptions(
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3 ),
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                viewportFraction: .7,
                enlargeCenterPage: true,

              ),
            ),
          ),
        ],
      ),
    )
);

Widget buildCityNameItem()=>ListTile(
  leading: Icon(Icons.circle,size: 20,color: Colors.teal,),
  title: Text('Isamailia',
    style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600
    ),
  ),
  onTap: (){
    print('clicked');
  },
  trailing: Icon(Icons.arrow_forward_ios_outlined,),
);

/*Widget BuildMapIcon()=>Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: Colors.teal,
  ),
  child: IconButton(
    splashRadius: 200,
    icon: const Icon(Icons.pin_drop_outlined,color: Colors.white,),
    onPressed: (){
      Navigator.push(
         ,
        MaterialPageRoute(builder: (context) => const MapScreen()),
      );
    },
  ),
);

*/