import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_guide/layout/cubit/cubit.dart';
import 'package:e_guide/layout/cubit/states.dart';
import 'package:e_guide/models/tourist_places_model/tourist_place_model.dart';
import 'package:e_guide/modules/club_item/club_item.dart';
import 'package:e_guide/modules/tourist_place_item/tourist_place_item.dart';
import 'package:e_guide/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetTouritPlaces extends StatelessWidget {
 // const GetTouritPlaces({Key? key}) : super(key: key);
  TourisPlacetModel? tourisPlacetModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) => (){},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: AppCubit.get(context).homeModel!.data!.touristPlace!=null&&AppCubit.get(context).tourisPlacetModel!=null,
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text(
                'Tourist Places',
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
                    itemBuilder: (context, index) => TouristPlaceItemBuilder(index,context),
                    separatorBuilder: (context, index) => myDivider(),
                    itemCount: AppCubit.get(context).tourisPlacetModel!.data!.length,
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
Widget TouristPlaceItemBuilder(int index,BuildContext context)=>Container(
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
          image: NetworkImage(AppCubit.get(context).tourisPlacetModel!.data![index].pic![0]),
          fit: BoxFit.contain,
          width: double.infinity,
        ),
      Text(
          AppCubit.get(context).tourisPlacetModel!.data![index].name.toString(),
        style: TextStyle(
            fontSize: 20,
          color: Colors.teal
        ),
      ),
      Text(
          AppCubit.get(context).tourisPlacetModel!.data![index].address.toString(),
        style: TextStyle(
          fontSize: 17
        ),
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
      Row(
        children: [
          Spacer(),
          TextButton(
              onPressed: () {
                navigateTo(context, TouristPlaceItem(
                  AppCubit.get(context).tourisPlacetModel!.data![index].rate,
                  AppCubit.get(context).tourisPlacetModel!.data![index].pic,
                  AppCubit.get(context).tourisPlacetModel!.data![index].name,
                  AppCubit.get(context).tourisPlacetModel!.data![index].description,
                  AppCubit.get(context).tourisPlacetModel!.data![index].address,
                  AppCubit.get(context).tourisPlacetModel!.data![index].workTime,
                  AppCubit.get(context).tourisPlacetModel!.data![index].price,
                  AppCubit.get(context).tourisPlacetModel!.data![index].lat,
                  AppCubit.get(context).tourisPlacetModel!.data![index].lng,
                  AppCubit.get(context).tourisPlacetModel!.data![index].id,

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
);