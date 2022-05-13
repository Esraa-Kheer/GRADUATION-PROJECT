
import 'package:e_guide/modules/log_in/log_in_screen.dart';
import 'package:e_guide/shared/components/components.dart';
import 'package:e_guide/shared/network/local/cashe_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(child: Column(
      children: [
        TextButton(
            onPressed: (){

              CasheHelper.removeData(key: 'token').then((value) {
                if(value){
                  navigateAndFinish(context,LogInScreen());
                }
              });
            },
            child: Text(
                'SIGN OUT'
            )
        ),
        Text('Favorite',style: TextStyle(fontSize: 25),),
      ],
    ));
  }
}
