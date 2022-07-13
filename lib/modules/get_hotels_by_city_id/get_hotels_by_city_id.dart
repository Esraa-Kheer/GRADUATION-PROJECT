import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_guide/layout/cubit/cubit.dart';
import 'package:e_guide/layout/cubit/states.dart';
import 'package:e_guide/models/hotels_model/hotels_model.dart';
import 'package:e_guide/modules/hotel_item/hotel_item.dart';
import 'package:e_guide/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetHotels extends StatelessWidget {
   //GetHotels({Key? key}) : super(key: key);
  late HotelModel? hotelModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) => (){},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: AppCubit.get(context).hotelModel!=null,
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text(
                'Hotels',
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
                    itemBuilder: (context, index) => HotelsItemBuilder(index,context),
                    separatorBuilder: (context, index) => SizedBox(height: 10,),
                    itemCount: AppCubit.get(context).hotelModel!.data!.length,
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
Widget HotelsItemBuilder(int index,BuildContext context)=>Container(
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
        image: NetworkImage(AppCubit.get(context).hotelModel!.data![index].pic![0]),
        //image: NetworkImage(restaurantsModel.data!.single.pic![0].toString()),
        fit: BoxFit.contain,
        width: double.infinity,
      ),
      Text(AppCubit.get(context).hotelModel!.data![index].name.toString()),
      Row(
        children: [
          //Text(AppCubit.get(context).hotelModel!.data![index].cuisineType.toString()),
          Spacer(),
          TextButton(
              onPressed: () {
                navigateTo(context, HotelItem(
                  AppCubit.get(context).hotelModel!.data![index].pic,
                  AppCubit.get(context).hotelModel!.data![index].name,
                  AppCubit.get(context).hotelModel!.data![index].address,
                  AppCubit.get(context).hotelModel!.data![index].rate,
                  AppCubit.get(context).hotelModel!.data![index].roomsNumbers,
                  AppCubit.get(context).hotelModel!.data![index].singlePrice,
                  AppCubit.get(context).hotelModel!.data![index].doublePrice,
                  AppCubit.get(context).hotelModel!.data![index].lat,
                  AppCubit.get(context).hotelModel!.data![index].lng,
                  AppCubit.get(context).hotelModel!.data![index].id,

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