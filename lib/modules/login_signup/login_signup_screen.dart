import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class LoginSignupScreen extends StatefulWidget {
   const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {

  var nameControllerUp=TextEditingController();
  var emailControllerUp=TextEditingController();
  var passwordControllerUp=TextEditingController();
  var emailControllerIn=TextEditingController();
  var passwordControllerIn=TextEditingController();
  var formKey1=GlobalKey<FormState>();
  var formKey2=GlobalKey<FormState>();
  bool isPasswordUp=true;
  bool isPasswordIn=true;
  bool checkBoxValue=true;
  bool isSignupScreen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/pic1.png'),
                      fit: BoxFit.fill
                    ),
                  ),
                child: Container(
                  padding: const EdgeInsets.only(top: 60,left: 20),
                  color: Colors.teal.withOpacity(.15),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: const TextSpan(
                            text: 'Welcome to',
                            style: TextStyle(
                              fontFamily: 'Pacifico',
                              fontSize: 25,
                              letterSpacing: 2,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                              text: ' E-Guide',
                              style: TextStyle(
                                fontFamily: 'Pacifico',
                                fontSize: 27,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),
                              ),
                            ]
                          ),
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        'Explore The World',
                        style: TextStyle(
                          fontSize: 20,
                          //fontFamily: 'Gideon Roman',
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 262),
              child: AnimatedPositioned(
                duration: const Duration(milliseconds: 700),
                curve: Curves.bounceInOut,
                //top: 262,
                child: AnimatedContainer(
                  duration:const Duration(milliseconds: 700),
                  curve: Curves.bounceInOut,
                  //height: 380,
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width-40,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow:  const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 15,
                        //spreadRadius: 5
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:  [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  isSignupScreen=false;
                                });
                              },
                              child: Column(
                                children:  [
                                  Text(
                                    'Signup',
                                    style: TextStyle(
                                      color:isSignupScreen? Colors.grey:Colors.teal,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  isSignupScreen=true;
                                });
                              },
                              child: Column(
                                children:  [
                                  Text(
                                    'Signin',
                                    style: TextStyle(
                                        color:isSignupScreen? Colors.teal:Colors.grey,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: isSignupScreen? Column(
                            children: [
                              Form(
                                key: formKey1,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 20,),
                                    TextFormField(
                                      validator: (value){
                                        if(value!.isEmpty) {
                                          return 'Email Address must not be empty';
                                        }
                                        return null;
                                      },
                                      controller: emailControllerIn,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(Icons.email,color: Colors.teal),
                                          hintText: 'Email Address',
                                          labelText: 'Email',
                                          border: OutlineInputBorder(
                                          )
                                      ),
                                    ),
                                    const SizedBox(height: 15,),
                                    TextFormField(
                                      validator: (value){
                                        if(value!.isEmpty) {
                                          return 'Password must not be empty';
                                        }
                                        return null;
                                      },
                                      controller: passwordControllerIn,
                                      keyboardType: TextInputType.visiblePassword,
                                      obscureText: isPasswordIn,
                                      decoration:  InputDecoration(
                                        prefixIcon: const Icon(Icons.lock,color: Colors.teal),
                                        suffixIcon: IconButton(
                                          icon: Icon(!isPasswordIn?Icons.visibility:Icons.visibility_off,color: Colors.teal),
                                          onPressed: () {
                                            setState(() {
                                              isPasswordIn=!isPasswordIn;
                                            });
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

                                              setState(() {
                                                checkBoxValue=value!;
                                              });
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
                              const SizedBox(height: 18,),
                              Container(
                                width: 120,
                                height: 40,
                                color: Colors.teal,
                                child: MaterialButton(
                                  onPressed: (){
                                    if(formKey1.currentState!.validate()){
                                      print(emailControllerIn.text);
                                      print(passwordControllerIn.text);
                                    }
                                  },
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ):Column(
                            children: [
                              Form(
                                key:formKey2,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 20,),
                                    TextFormField(
                                      validator: (value){
                                        if(value!.isEmpty) {
                                          return 'Name must not be empty';
                                        }
                                        return null;
                                      },
                                      controller: nameControllerUp,
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(Icons.person,color: Colors.teal,),
                                          hintText: 'Name',
                                          labelText: 'Name',
                                          border: OutlineInputBorder(
                                          )
                                      ),
                                    ),
                                    const SizedBox(height: 15,),
                                    TextFormField(
                                      validator: (value){
                                        if(value!.isEmpty) {
                                          return 'Email Address must not be empty';
                                        }
                                        return null;
                                      },
                                      controller: emailControllerUp,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(Icons.email,color: Colors.teal),
                                          hintText: 'Email Address',
                                          labelText: 'Email',
                                          border: OutlineInputBorder(
                                          )
                                      ),
                                    ),
                                    const SizedBox(height: 15,),
                                    TextFormField(
                                      validator: (value){
                                        if(value!.isEmpty) {
                                          return 'Password must not be empty';
                                        }
                                        return null;
                                      },
                                      controller: passwordControllerUp,
                                      keyboardType: TextInputType.visiblePassword,
                                      obscureText: isPasswordUp,
                                      decoration:  InputDecoration(
                                        prefixIcon: const Icon(Icons.lock,color: Colors.teal),
                                        suffixIcon: IconButton(
                                          icon:  Icon(
                                              !isPasswordUp? Icons.visibility:Icons.visibility_off,color: Colors.teal
                                          ), onPressed: () {
                                          setState(() {
                                            isPasswordUp=!isPasswordUp;
                                          });
                                        },),
                                        hintText: 'Password',
                                        labelText: 'Password',
                                        border: const OutlineInputBorder(
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 15,),
                                  ],
                                ),
                              ),
                              Container(
                                width: 120,
                                height: 40,
                                color: Colors.teal,
                                child: MaterialButton(
                                  onPressed: (){
                                    if(formKey2.currentState!.validate()){
                                      print(nameControllerUp.text);
                                      print(emailControllerUp.text);
                                      print(passwordControllerUp.text);
                                    }
                                  },
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                             Row(children: <Widget>[
                                Expanded(
                                  child: Container(
                                      margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                                      child: const Divider(
                                        color: Colors.black,
                                        height: 50,
                                      )),
                                ),
                                const Text("OR"),
                                Expanded(
                                  child: Container(
                                      margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                                      child: const Divider(
                                        color: Colors.black,
                                        height: 50,
                                      )),
                                ),
                              ]),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(onPressed: (){}, icon: const Icon(Icons.facebook_outlined)),
                                  const SizedBox(width: 15,),
                                  IconButton(onPressed: (){}, icon: const Icon(Icons.email_outlined)),
                                  const SizedBox(width: 15,),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
