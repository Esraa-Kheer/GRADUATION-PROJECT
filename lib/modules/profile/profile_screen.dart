
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_guide/layout/cubit/cubit.dart';
import 'package:e_guide/layout/cubit/states.dart';
import 'package:e_guide/models/login_model/login_model.dart';
import 'package:e_guide/modules/log_in/log_in_screen.dart';
import 'package:e_guide/shared/components/components.dart';
import 'package:e_guide/shared/network/local/cashe_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  late var nameController=TextEditingController();
  late var emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
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
            Text('Profile',style: TextStyle(fontSize: 25),),
          ],
        ),
      ),
    );
     /* BlocConsumer<AppCubit,AppStates>(
      listener:(context, state) {
        /*if(state is AppSuccessUserDataState){
          nameController.text=state.loginModel.data.name;
          emailController.text=state.loginModel.data.email;
        }*/
      },
      builder: (context, state) {
        var model=AppCubit.get(context).userModel;
        nameController.text=model.data.name;
        emailController.text=model.data.email;
        return Center(
          child: SingleChildScrollView(
            child: ConditionalBuilder(
              condition: true,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    TextFormField(
                      validator: (value){
                        if(value!.isEmpty) {
                          return 'Name Address must not be empty';
                        }
                        return null;
                      },
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person,color: Colors.teal),
                          hintText: 'Name',
                          labelText: 'Name',
                          border: OutlineInputBorder(
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      validator: (value){
                        if(value!.isEmpty) {
                          return 'Email Address must not be empty';
                        }
                        return null;
                      },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email,color: Colors.teal),
                          hintText: 'Email Address',
                          labelText: 'Email',
                          border: OutlineInputBorder(
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    /*TextFormField(
                      validator: (value){
                        if(value!.isEmpty) {
                          return 'Password Address must not be empty';
                        }
                        return null;
                      },
                      controller: passwordController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock,color: Colors.teal),
                          hintText: ' Password',
                          labelText: 'Password',
                          border: OutlineInputBorder(
                          )
                      ),
                    ),*/

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
                    Text(
                      'Profile'
                      ,style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
              fallback:(context) =>  Center(child: CircularProgressIndicator()),
            ),
          ),
        );
      },
    );*/
  }
}
