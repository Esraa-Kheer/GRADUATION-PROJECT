
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

  late var nameController = TextEditingController();
  late var emailController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
         var model =AppCubit.get(context).userModel;
        nameController.text=model!.data.name;
        emailController.text=model.data.email;

        return ConditionalBuilder(
          condition: AppCubit.get(context).userModel!=null,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Scaffold(
              body: SingleChildScrollView(
                child: Center(
                  child: Column(

                    children: [
                      Text('Profile', style: TextStyle(fontSize: 25),),
                      ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          ExpansionTile(
                              title: Row(
                                children: [
                                  Icon(Icons.person),
                                  SizedBox(width: 10,),
                                  Text('Account Information'),
                                ],
                              ),
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Name must not be empty';
                                  }
                                  return null;
                                },
                                controller: nameController,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.person, color: Colors.teal),
                                    hintText: 'Name',
                                    suffixIcon: IconButton(onPressed: null, icon: Icon(Icons.edit))
                                    //labelText: 'Name',

                                ),
                              ),
                              SizedBox(height: 25,),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Email Address must not be empty';
                                  }
                                  return null;
                                },
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.email, color: Colors.teal),
                                    hintText: 'Email Address',
                                    suffixIcon: IconButton(onPressed: null, icon: Icon(Icons.edit))

                                  //labelText: 'Email',

                                ),
                              ),
                            ],
                          ),
                          ExpansionTile(
                              title: Row(
                                children: [
                                  Icon(Icons.add_location_alt_outlined),
                                  SizedBox(width: 10,),

                                  Text('Location'),
                                ],
                              ),
                            children: [
                            ],
                          ),
                          ExpansionTile(
                            title: Row(
                              children: [
                                Icon(Icons.settings_rounded),
                                SizedBox(width: 10,),

                                Text('Settings'),
                              ],
                            ),
                            children: [
                            ],
                          ),
                          ExpansionTile(
                            title: Row(
                              children: [
                                Icon(Icons.add_ic_call_outlined),
                                SizedBox(width: 10,),
                                Text('Contact Us'),
                              ],
                            ),
                            children: [
                              Text('Suez Canal University, Faculty Of Computers And Informatics',)
                            ],
                          ),
                          ExpansionTile(
                            title: Row(
                              children: [
                                Icon(Icons.support_agent_outlined),
                                SizedBox(width: 10,),
                                Text('Support Center'),
                              ],
                            ),
                            children: [
                              Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum")
                            ],
                          ),

                        ],
                      ),

                      SizedBox(height: 20,),
                      TextButton(
                          onPressed: () {
                            CasheHelper.removeData(key: 'token').then((value) {
                              if (value) {
                                navigateAndFinish(context, LogInScreen());
                              }
                            });
                          },
                          child: Container(
                            width: 180,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.teal,
                                width: 1
                              ),
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Text(
                                'SIGN OUT',
                              style: TextStyle(
                                fontSize: 22
                              ),
                            ),
                          )
                      ),

                    ],
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