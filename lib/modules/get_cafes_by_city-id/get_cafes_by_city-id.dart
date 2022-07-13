import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_guide/layout/cubit/cubit.dart';
import 'package:e_guide/layout/cubit/states.dart';
import 'package:e_guide/models/cafes_model/cafes_model.dart';
import 'package:e_guide/modules/cafe_item/cafe_item.dart';
import 'package:e_guide/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCafes extends StatelessWidget {
   GetCafes({Key? key}) : super(key: key);

  late CafesModel? cafesModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) => (){},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: AppCubit.get(context).cafesModel!=null,
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text(
                'Cafes',
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
                    itemBuilder: (context, index) => CafesItemBuilder(index,context),
                    separatorBuilder: (context, index) => SizedBox(height: 10,),
                    itemCount: AppCubit.get(context).cafesModel!.data!.length,
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
Widget CafesItemBuilder(int index,BuildContext context)=>Container(
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
        image: NetworkImage(AppCubit.get(context).cafesModel!.data![index].pic![0]),
        //image: NetworkImage(restaurantsModel.data!.single.pic![0].toString()),
        fit: BoxFit.contain,
        width: double.infinity,
      ),
      Text(AppCubit.get(context).cafesModel!.data![index].name.toString()),
      Row(
        children: [
          Text(AppCubit.get(context).cafesModel!.data![index].cuisineType.toString()),
          Spacer(),
          TextButton(
              onPressed: () {
                navigateTo(context, CafeItem(
                  AppCubit.get(context).cafesModel!.data![index].pic,
                  AppCubit.get(context).cafesModel!.data![index].menu,
                  AppCubit.get(context).cafesModel!.data![index].name,
                  AppCubit.get(context).cafesModel!.data![index].address,
                  AppCubit.get(context).cafesModel!.data![index].rate,
                  AppCubit.get(context).cafesModel!.data![index].workTime,
                  AppCubit.get(context).cafesModel!.data![index].cuisineType,
                  AppCubit.get(context).cafesModel!.data![index].lat,
                  AppCubit.get(context).cafesModel!.data![index].lng,
                  AppCubit.get(context).cafesModel!.data![index].id,

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