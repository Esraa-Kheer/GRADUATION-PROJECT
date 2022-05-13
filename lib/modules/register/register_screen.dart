import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_guide/layout/app_layout.dart';
import 'package:e_guide/modules/log_in/log_in_screen.dart';
import 'package:e_guide/modules/register/cubit/states.dart';
import 'package:e_guide/shared/components/components.dart';
import 'package:e_guide/shared/network/local/cashe_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';


class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);
  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var formKey=GlobalKey<FormState>();
  bool isPassword=false;
  bool isSignupScreen = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=>AppRegisterCubit(),
      child: BlocConsumer<AppRegisterCubit,AppRegisterStates>(
        listener: (context, state) {
          if(state is AppRegisterSuccessState)
          {
            if(state.loginModel.status) {
              print(state.loginModel.message);
              print(state.loginModel.data.token);
              CasheHelper
                  .saveData(key: 'token', value: state.loginModel.data.token)
                  .then((value) {
                    //token=state.loginModel.data.token;
                navigateAndFinish(context, const HomeLayout());

              }).catchError((error){
                print(error.toString());
              });

            }else{
              print(state.loginModel.message);

            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white24,
              elevation: 0,
            ),
            body: Padding(
              padding:  const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const Text(
                      'Registeration',
                      style: TextStyle(
                          color:Colors.teal,
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text(
                      'Register With Your Data To Browse Our Application',
                      maxLines: 2,
                      style: TextStyle(
                        color:Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 40,),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value){
                              if(value!.isEmpty) {
                                return 'Name must not be empty';
                              }
                              return null;
                            },
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person,color: Colors.teal),
                                hintText: 'Name',
                                labelText: 'Name',
                                border: OutlineInputBorder(
                                )
                            ),
                          ),
                          const SizedBox(height: 30,),
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
                          const SizedBox(height: 30,),
                          TextFormField(
                            validator: (value){
                              if(value!.isEmpty) {
                                return 'Password must not be empty';
                              }
                              return null;
                            },
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: isPassword,
                            decoration:  InputDecoration(
                              prefixIcon: Icon(Icons.lock,color: Colors.teal),
                              suffixIcon: IconButton(
                                icon: Icon(!isPassword?Icons.visibility:Icons.visibility_off,color: Colors.teal),
                                onPressed: () {
                                  AppRegisterCubit.get(context).changePasswordVisibility();
                                },),
                              hintText: 'Password',
                              labelText: 'Password',
                              border: const OutlineInputBorder(
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    ConditionalBuilder(
                      condition: state is! AppRegisterLoadingState,
                      builder: (context) => Container(
                        width: double.infinity,
                        height: 60,
                        color: Colors.teal,
                        child: MaterialButton(
                          onPressed: (){
                            if(formKey.currentState!.validate()){
                              AppRegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text
                              );
                              print(nameController.text);
                              print(emailController.text);
                              print(passwordController.text);
                            };
                            //navigateAndFinish(context, const HomeLayout());
                          },
                          child: const Text(
                            'sign up',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      fallback: (context) => const Center(child: CircularProgressIndicator()),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:   [
                        const Text(
                          "Already have an account!",
                          maxLines: 2,
                          style: TextStyle(
                            color:Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            navigateAndFinish(context,  LogInScreen());
                          },
                          child: const Text(
                            'Login ',
                            style: TextStyle(
                                color: Colors.teal,
                                fontSize: 12
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          );
        },
      ),
    );
  }
}

