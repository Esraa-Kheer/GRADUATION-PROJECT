import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_guide/layout/cubit/cubit.dart';
import 'package:e_guide/layout/cubit/states.dart';
import 'package:e_guide/models/city_model/city_model.dart';
import 'package:e_guide/models/home_model/home_model.dart';
import 'package:e_guide/modules/cafe_item/cafe_item.dart';
import 'package:e_guide/modules/city_info/city_info.dart';
import 'package:e_guide/modules/restaurant_item/restaurant_item.dart';
import 'package:e_guide/modules/tourist_place_item/tourist_place_item.dart';
import 'package:e_guide/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
late RestaurantItem restaurantItem;
class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
late CitiesModel citiesModel;
late HomeModel homeModel;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
     listener: (context, state) => (){},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: AppCubit.get(context).citiesModel!=null&&AppCubit.get(context).homeModel!=null,
            builder: (context) => HomeBuilder( AppCubit.get(context).citiesModel!,
                AppCubit.get(context).homeModel!,

                context),
            fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

Widget HomeBuilder(CitiesModel citiesModel,HomeModel homeModel,BuildContext context)=>Scaffold(
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Row(
                children: [
                  Container(
                    child: Flexible(
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
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
                                  textBaseline: TextBaseline.alphabetic,
                                ),
                              ),
                              onTap: (){
                                print('clicked');


                                navigateTo( context, CityInfoScreen(
                                  pic: e.pic,
                                  name: e.name,
                                  area: e.area,
                                  population: e.population,
                                  aboutTheCity: e.aboutTheCity,
                                  lat: e.lat,
                                  lng: e.lng,
                                  id: e.id,
                                ));
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
            CarouselSlider(
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
           Text(
               '#Trending',
             style: TextStyle(
               color: Colors.teal,
               fontSize: 25
             ),
           ),
           Container(
             decoration: BoxDecoration(
               border: Border.all(
                 width: 1,
                 color: Colors.grey
               ),
               borderRadius: BorderRadius.all(
                 Radius.circular(40)
               )
               ),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 children: [
                   ListTile(
                     title: Text(
                       'Restaurants',
                       style: TextStyle(
                           color: Colors.black87,
                           fontSize: 20
                       ),
                     ),
                   ),
                   ListView.separated(
                     shrinkWrap: true,
                       physics: NeverScrollableScrollPhysics(),
                       itemBuilder: (context, index) => Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(
                             Radius.circular(30)
                           )
                         ),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Image(
                               image: NetworkImage(homeModel.data!.restaurants![index].pic![0].toString()),
                               fit: BoxFit.contain,
                               width: double.infinity,
                             ),
                             Text(homeModel.data!.restaurants![index].name.toString()),
                             Row(
                               children: [
                                 Text(homeModel.data!.restaurants![index].cuisineType.toString()),
                                 Spacer(),
                                 TextButton(
                                      onPressed: () async{
                                        //await AppCubit.get(context).getRestaurants(restaurantItem.id);
                                         navigateTo(context,await RestaurantItem(
                                         AppCubit.get(context).homeModel!.data!.restaurants![index].pic,
                                         AppCubit.get(context).homeModel!.data!.restaurants![index].menu,
                                           AppCubit.get(context).homeModel!.data!.restaurants![index].inWishList,
                                           AppCubit.get(context).homeModel!.data!.restaurants![index].name,
                                         AppCubit.get(context).homeModel!.data!.restaurants![index].address,
                                         AppCubit.get(context).homeModel!.data!.restaurants![index].rate,
                                         AppCubit.get(context).homeModel!.data!.restaurants![index].workTime,
                                         AppCubit.get(context).homeModel!.data!.restaurants![index].cuisineType,
                                         AppCubit.get(context).homeModel!.data!.restaurants![index].lat,
                                         AppCubit.get(context).homeModel!.data!.restaurants![index].lng,
                                         AppCubit.get(context).homeModel!.data!.restaurants![index].id,

                                       ));
                                     },
                                     child: Text(
                                         'More Info'
                                     )
                                 ),
                               ],
                             ),
                           ],
                         ),
                       ),
                       separatorBuilder: (context, index) => SizedBox(height: 10,),
                       itemCount: homeModel.data!.restaurants!.length,
                   ),

                 ],
               ),
             ),
           ),///////////////Restaurants//////////////////
           SizedBox(height: 20,),
           Container(
             decoration: BoxDecoration(
                 border: Border.all(
                     width: 1,
                     color: Colors.grey
                 ),
                 borderRadius: BorderRadius.all(
                     Radius.circular(40)
                 )
             ),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 children: [
                   const ListTile(
                     title: Text(
                       'Cafes',
                       style: TextStyle(
                           color: Colors.black87,
                           fontSize: 20
                       ),
                     ),
                   ),

                   ListView.separated(
                     shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                     itemBuilder: (context, index) => Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(
                               Radius.circular(30)
                           )
                       ),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Image(
                             image: NetworkImage(homeModel.data!.cafes![index].pic![0].toString()),
                             fit: BoxFit.contain,
                             width: double.infinity,
                           ),
                           Text(homeModel.data!.cafes![index].name.toString()),
                           Row(
                             children: [
                               //Text(homeModel.data!.restaurants[index].cuisineType.toString()),
                               Spacer(),

                               TextButton(
                                   onPressed: () {
                                     navigateTo(context, CafeItem(
                                       AppCubit.get(context).homeModel!.data!.cafes![index].pic,
                                       AppCubit.get(context).homeModel!.data!.cafes![index].menu,
                                       AppCubit.get(context).homeModel!.data!.cafes![index].name,
                                       AppCubit.get(context).homeModel!.data!.cafes![index].rate,
                                       AppCubit.get(context).homeModel!.data!.cafes![index].address,
                                       AppCubit.get(context).homeModel!.data!.cafes![index].workTime,
                                       AppCubit.get(context).homeModel!.data!.cafes![index].cuisineType,
                                       AppCubit.get(context).homeModel!.data!.cafes![index].lat,
                                       AppCubit.get(context).homeModel!.data!.cafes![index].lng,
                                       AppCubit.get(context).homeModel!.data!.cafes![index].id,

                                     ));
                                   },
                                   child: Text(
                                       'More Info'
                                   )
                               ),
                             ],
                           ),
                         ],
                       ),
                     ),
                     separatorBuilder: (context, index) => SizedBox(height: 10,),
                     itemCount: homeModel.data!.cafes!.length,
                   ),

                 ],
               ),
             ),
           ), ///////////////////cafes////////////////////////////
           SizedBox(height: 20,),
           Container(
             decoration: BoxDecoration(
                 border: Border.all(
                     width: 1,
                     color: Colors.grey
                 ),
                 borderRadius: BorderRadius.all(
                     Radius.circular(40)
                 )
             ),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 children: [
                   const ListTile(
                     title: Text(
                       'Hotels',
                       style: TextStyle(
                           color: Colors.black87,
                           fontSize: 20
                       ),
                     ),
                   ),

                   ListView.separated(
                     shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                     itemBuilder: (context, index) => Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(
                               Radius.circular(30)
                           )
                       ),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           /* homeModel.data.hotels.map((e) {
                             Image(image: NetworkImage(e.pic[0].toString()),),
                           })*/
                           Image(
                             image: NetworkImage(homeModel.data!.hotels!.elementAt(index).pic[0]),
                             fit: BoxFit.contain,
                             width: double.infinity,
                           ),
                           Text(homeModel.data!.hotels![index].name.toString()),
                           Row(
                             children: [
                               //Text(homeModel.data!.restaurants[index].cuisineType.toString()),
                               Spacer(),

                               TextButton(
                                   onPressed: () {

                                   },
                                   child: Text(
                                       'More Info'
                                   )
                               ),
                             ],
                           ),
                         ],
                       ),
                     ),
                     separatorBuilder: (context, index) => SizedBox(height: 10,),
                     itemCount: AppCubit.get(context).homeModel!.data!.hotels!.length,
                   ),

                 ],
               ),
             ),
           ),////////////////////////Hotels////////////////
           SizedBox(height: 20,),
           Container(
             decoration: BoxDecoration(
                 border: Border.all(
                     width: 1,
                     color: Colors.grey
                 ),
                 borderRadius: BorderRadius.all(
                     Radius.circular(40)
                 )
             ),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 children: [
                   const ListTile(
                     title: Text(
                       'Clubs',
                       style: TextStyle(
                           color: Colors.black87,
                           fontSize: 20
                       ),
                     ),
                   ),

                   ListView.separated(
                     shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                     itemBuilder: (context, index) => Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(
                               Radius.circular(30)
                           )
                       ),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           /* homeModel.data.hotels.map((e) {
                             Image(image: NetworkImage(e.pic[0].toString()),),
                           })*/
                           Image(
                             image: NetworkImage(homeModel.data!.club!.elementAt(index).pic![0]),
                             fit: BoxFit.contain,
                             width: double.infinity,
                           ),
                           Text(homeModel.data!.club![index].name.toString()),
                           Row(
                             children: [
                               //Text(homeModel.data!.restaurants[index].cuisineType.toString()),
                               Spacer(),

                               TextButton(
                                   onPressed: () {

                                   },
                                   child: Text(
                                       'More Info'
                                   )
                               ),
                             ],
                           ),
                         ],
                       ),
                     ),
                     separatorBuilder: (context, index) => SizedBox(height: 10,),
                     itemCount: homeModel.data!.club!.length,
                   ),

                 ],
               ),
             ),
           ),////////////////////////Clubs////////////////
           SizedBox(height: 20,),
           Container(
             decoration: BoxDecoration(
                 border: Border.all(
                     width: 1,
                     color: Colors.grey
                 ),
                 borderRadius: BorderRadius.all(
                     Radius.circular(40)
                 )
             ),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 children: [
                    ListTile(
                     title: Text(
                       'Tourist Places',
                       style: TextStyle(
                           color: Colors.black87,
                           fontSize: 20
                       ),
                     ),
                   ),

                   ListView.separated(
                     shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                     itemBuilder: (context, index) => Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(
                               Radius.circular(30)
                           )
                       ),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Image(
                             image: NetworkImage(homeModel.data!.touristPlace!.elementAt(index).pic![0]),
                             fit: BoxFit.contain,
                             width: double.infinity,
                           ),
                           Text(homeModel.data!.touristPlace![index].name.toString()),
                           Row(
                             children: [
                               Spacer(),
                               TextButton(
                                   onPressed: () {
                                     navigateTo(context, TouristPlaceItem(
                                       AppCubit.get(context).homeModel!.data!.touristPlace![index].rate,
                                       AppCubit.get(context).homeModel!.data!.touristPlace![index].pic,
                                       AppCubit.get(context).homeModel!.data!.touristPlace![index].name,
                                       AppCubit.get(context).homeModel!.data!.touristPlace![index].description,
                                       AppCubit.get(context).homeModel!.data!.touristPlace![index].address,
                                       AppCubit.get(context).homeModel!.data!.touristPlace![index].workTime,
                                       AppCubit.get(context).homeModel!.data!.touristPlace![index].price,
                                       AppCubit.get(context).homeModel!.data!.touristPlace![index].lat,
                                       AppCubit.get(context).homeModel!.data!.touristPlace![index].lng,
                                       AppCubit.get(context).homeModel!.data!.touristPlace![index].id,
                                     ));
                                   },
                                   child: Text(
                                       'More Info'
                                   )
                               ),
                             ],
                           ),
                         ],
                       ),
                     ),
                     separatorBuilder: (context, index) => SizedBox(height: 10,),
                     itemCount: homeModel.data!.touristPlace!.length,
                   ),
                 ],
               ),
             ),
           ),////////////////////////TouristPlaces////////////////
          ],
        ),
      ),
    )
);




