import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_guide/layout/app_layout.dart';
import 'package:e_guide/modules/log_in/cubit/cubit.dart';
import 'package:e_guide/modules/log_in/cubit/states.dart';
import 'package:e_guide/modules/register/register_screen.dart';
import 'package:e_guide/shared/components/components.dart';
import 'package:e_guide/shared/network/local/cashe_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LogInScreen extends StatelessWidget {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var formKey=GlobalKey<FormState>();
  bool isPassword=false;
  bool checkBoxValue=true;
  bool isSignupScreen = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>AppLoginCubit() ,
      child: BlocConsumer<AppLoginCubit,AppLoginStates>(
        listener: (context, state) {
          if(state is AppLoginSuccessState)
            {
              if(state.loginModel.status) {
                  print(state.loginModel.message);
                  print(state.loginModel.data.token);
                  CasheHelper.saveData(key: 'token', value: state.loginModel.data.token).then((value) {
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
                      'Welcome back!',
                      style: TextStyle(
                          color:Colors.teal,
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text(
                      'Log in with your data that you entered during your registration',
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
                            obscureText: AppLoginCubit.get(context).isPassword,
                            decoration:  InputDecoration(
                              prefixIcon: Icon(Icons.lock,color: Colors.teal),
                              suffixIcon: IconButton(
                                icon: Icon(AppLoginCubit.get(context).suffix,color: Colors.teal),
                                onPressed: () {
                                  AppLoginCubit.get(context).changePasswordVisibility();
                                },),
                              hintText: 'Password',
                              labelText: 'Password',
                              border: const OutlineInputBorder(
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Checkbox(
                                  value: checkBoxValue,
                                  onChanged: (value){

                                    /* setState(() {
                                    checkBoxValue=value!;
                                  });*/
                                  }
                              ),
                              const Text(
                                'Remember me',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12
                                ),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: (){},
                                child: const Text(
                                  'Forget Password?',
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

                    const SizedBox(height: 30,),
                    Center(
                      child: ConditionalBuilder(
                        condition: state is! AppLoginLoadingState,
                        builder: (context) => Container(
                          width: double.infinity,
                          height: 60,
                          color: Colors.teal,
                          child: MaterialButton(
                            onPressed: (){
                              if(formKey.currentState!.validate()){
                                print(emailController.text);
                                print(passwordController.text);
                                AppLoginCubit.get(context).userLogin(email: emailController.text, password: passwordController.text);

                              };
                              //navigateAndFinish(context, const HomeLayout());

                            },
                            child: const Text(
                              'sign in',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        fallback: (context) => CircularProgressIndicator(),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:   [
                        const Text(
                          "Don't have an account?",
                          maxLines: 2,
                          style: TextStyle(
                            color:Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            navigateAndFinish(context, RegisterScreen());
                          },
                          child: const Text(
                            'Register Now.',
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

