import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_guide/layout/cubit/cubit.dart';
import 'package:e_guide/layout/cubit/states.dart';
import 'package:e_guide/models/restaurants_model/restaurants_model.dart';
import 'package:e_guide/modules/restaurant_item/restaurant_item.dart';
import 'package:e_guide/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetResturants extends StatelessWidget {
   GetResturants({Key? key}) : super(key: key);

   RestaurantsModel? restaurantsModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) => (){},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: AppCubit.get(context).homeModel!.data!.restaurants!=null&&AppCubit.get(context).restaurantsModel!=null,
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text(
                'Restaurants',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
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
                  child: ListView.separated(
                    //shrinkWrap: true,
                    //physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => RestaurantsItemBuilder(index,context),
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 10),
                      child: myDivider(),
                    ),
                    itemCount: AppCubit.get(context).restaurantsModel!.data!.length,
                  ),
                ),
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },

    );
  }
}
Widget RestaurantsItemBuilder(int index,BuildContext context)=>Container(
  decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
          Radius.circular(30)
      )
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:
    [
      SizedBox(height: 10,),
      Image(
        image: NetworkImage(AppCubit.get(context).restaurantsModel!.data![index].pic![0]),
        //image: NetworkImage(restaurantsModel.data!.single.pic![0].toString()),
        fit: BoxFit.contain,
        width: double.infinity,
      ),
      Text(
          AppCubit.get(context).restaurantsModel!.data![index].name.toString(),
        style:TextStyle(
          fontSize: 25,
          color: Colors.teal,
            fontFamily: 'AovelSansRounded'
        ) ,
      ),
      Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Causion Type : ',
                    style:TextStyle(
                      fontSize: 16,
                      color: Colors.teal
                    ) ,
                  ),
                  Text(
                      AppCubit.get(context).restaurantsModel!.data![index].cuisineType.toString(),
                    style:TextStyle(
                      fontSize: 16,
                    ) ,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Work Time : ',
                    style:TextStyle(
                        fontSize: 16,
                        color: Colors.teal
                    ) ,
                  ),
                  Text(
                    AppCubit.get(context).restaurantsModel!.data![index].workTime.toString(),
                    style:TextStyle(
                      fontSize: 16,
                    ) ,
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          TextButton(
              onPressed: () {
                navigateTo(context, RestaurantItem(
                  AppCubit.get(context).restaurantsModel!.data![index].pic,
                  AppCubit.get(context).restaurantsModel!.data![index].menu,
                  AppCubit.get(context).restaurantsModel!.data![index].inWishList,
                  AppCubit.get(context).restaurantsModel!.data![index].name,
                  AppCubit.get(context).restaurantsModel!.data![index].address,
                  AppCubit.get(context).restaurantsModel!.data![index].rate,
                  AppCubit.get(context).restaurantsModel!.data![index].workTime,
                  AppCubit.get(context).restaurantsModel!.data![index].cuisineType,
                  AppCubit.get(context).restaurantsModel!.data![index].lat,
                  AppCubit.get(context).restaurantsModel!.data![index].lng,
                  AppCubit.get(context).restaurantsModel!.data![index].id,

                ));
              },
              child: Text(
                  'More Info...',
                style: TextStyle(
                  color: Colors.teal.shade200
                ),
              )
          ),
        ],
      ),
    ],
  ),
);